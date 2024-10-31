package starter.selectors.factory;

import org.openqa.selenium.By;
import org.yaml.snakeyaml.Yaml;
import org.yaml.snakeyaml.error.YAMLException;
import net.thucydides.model.environment.SystemEnvironmentVariables;
import net.thucydides.model.util.EnvironmentVariables;

import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import static starter.selectors.factory.PageFactory.LOCATOR_MAP;

public class YamlFactory implements SelectorFactory {

    /**
     * The directory path is obtained from the "serenity.yaml.directory.path" property.
     */
    private final String directoryPath;

    /**
     * Creates a new YamlFactory instance.
     * The directory path is obtained from the "serenity.yaml.directory.path" property.
     */
    public YamlFactory() {
        EnvironmentVariables environmentVariables = SystemEnvironmentVariables.createEnvironmentVariables();
        directoryPath = environmentVariables.getProperty("serenity.yaml.directory.path");
    }

    /**
     * Returns a list of selectors defined in the YAML file specified by the given file path.
     *
     * @param filePath the path to the YAML file
     * @return a list of selectors defined in the file
     */
    private List<Map<String, String>> getSelectorsFromFile(String filePath) {
        List<Map<String, String>> selectors = new ArrayList<>();
        try (FileInputStream fis = new FileInputStream(filePath)) {
            Yaml yaml = new Yaml();
            Map<String, List<Map<String, Map<String, String>>>> data = yaml.load(fis);
            if (data != null) {
                data.values().forEach(
                        list -> list.forEach(
                                map -> map.values().forEach(
                                        selectors::add
                                )
                        )
                );
            }
        } catch (IOException | YAMLException e) {
            System.err.println("Error reading/parsing file: " + filePath + " - " + e.getMessage());
        }
        return selectors;
    }

    /**
     * Returns a list of all selectors defined in the YAML files located in the directory specified by the "serenity.yaml.directory.path" property.
     *
     * @param fileName the name of the file (without the extension)
     * @return a list of all selectors defined in the file
     */
    private List<Map<String, String>> getAllSelectorsFromPage(String fileName) {
        List<Map<String, String>> allSelectors = new ArrayList<>();
        try {
            allSelectors = Files.list(Paths.get(directoryPath))
                    .filter(Files::isRegularFile)
                    .filter(path -> path.getFileName().toString().replaceAll("\\.[^.]*$", "").equalsIgnoreCase(fileName))
                    .flatMap(path -> getSelectorsFromFile(path.toString()).stream())
                    .collect(Collectors.toList());
        } catch (IOException e) {
            System.err.println("Error reading files from directory: " + directoryPath + " - " + e.getMessage());
        }
        return allSelectors;
    }

    /**
     * Returns a By instance based on the name of the selector requested.
     *
     * @param name the name of the selector
     * @return a By instance based on the name of the selector
     */
    @Override
    public By getSelector(String name) {
        String page = PageFactory.getCurrentPageName();
        List<Map<String, String>> selector = getAllSelectorsFromPage(page);
        return selector.stream()
                .filter(query -> name.equalsIgnoreCase(query.get("name")))
                .findFirst()
                .map(this::getByFromElementData)
                .orElse(null);
    }

    /**
     * Returns a By instance based on the locator type and value from the given element data.
     *
     * @param  elementData a Map containing the locator type and value
     * @return             a By instance based on the locator type and value
     */
    private By getByFromElementData(Map<String, String> elementData) {
        String locatorType = elementData.get("locator-type");
        String locatorValue = elementData.get("locator-value");

        if (locatorType == null || locatorValue == null) {
            System.err.println("Error: 'Locator-Type' or 'Locator-Value' is null in element data: " + elementData);
            return null;
        }

        Function<String, By> byFunction = LOCATOR_MAP.get(locatorType);
        if (byFunction != null) {
            return byFunction.apply(locatorValue);
        } else {
            System.err.println("Error: Unsupported locator type: " + locatorType);
            return null;
        }
    }
}