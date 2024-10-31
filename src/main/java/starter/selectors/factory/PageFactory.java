package starter.selectors.factory;

import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import starter.selectors.pages.*;

import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

import static org.openqa.selenium.support.PageFactory.initElements;
import static starter.Constants.*;

public class PageFactory extends PageObject {

    /**
     * Map associating page names with their corresponding instances.
     */
    private static final Map<String, AbstractPage> map = new HashMap<String, AbstractPage>() {{
        put(LOGIN, initElements(getDriverStatic(), LoginPage.class));
        put(HOME_PAGE, initElements(getDriverStatic(), HomePage.class));
    }};

    /**
     * The currently selected page.
     */
    private static AbstractPage currentPage;

    /**
     * Gets the current page that is selected.
     *
     * @return The currently selected page.
     */
    public static AbstractPage getCurrentPage() {
        return currentPage;
    }

    /**
     * Gets the name of the current page that is selected.
     *
     * @return The name of the currently selected page.
     */
    public static String getCurrentPageName() {
        for (Map.Entry<String, AbstractPage> entry : map.entrySet()) {
            if (entry.getValue().equals(currentPage)) {
                return entry.getKey();
            }
        }
        return null;
    }

    /**
     * Sets the current page based on the provided page name.
     *
     * @param page Name of the page to set as the current page.
     */
    public static void setCurrentPage(String page) {
        currentPage = map.get(page);
    }

    /**
     * Gets a static instance of the WebDriver.
     *
     * @return Static instance of WebDriver.
     */
    public static WebDriver getDriverStatic() {
        return new PageFactory().getDriver();
    }

    /**
     * Gets a By object from a WebElement using the information from its toString().
     *
     * @param element WebElement from which to obtain the By selector.
     * @return By object corresponding to the WebElement's selector.
     * @throws IllegalArgumentException If the toString() format is not recognized.
     */
    public static By getWebElementSelector(WebElement element) {
        // Get the string representation of the WebElement
        String elementToString = element.toString();
        String[] parts = elementToString.split(" -> ");

        if (parts.length > 1) {
            // Extract information about the WebElement's selector
            String selectorInfo = parts[1].replace("]", "");
            String[] selectorParts = selectorInfo.split(": ");

            if (selectorParts.length == 2) {
                // Get selector type and value, and return the corresponding By object
                String selectorType = selectorParts[0].trim();
                String selectorValue = selectorParts[1].trim();

                Function<String, By> byFunction = LOCATOR_MAP.get(selectorType);
                if (byFunction != null) {
                    return byFunction.apply(selectorValue);
                } else {
                    throw new IllegalArgumentException("Unsupported locator type: " + selectorType);
                }
            }
        }

        // If the format is not recognized, throw an exception
        throw new IllegalArgumentException("Unrecognized format of WebElement.toString()");
    }

    /**
     * A map that associates locator types with functions that take a string parameter and return a By object.
     *
     * @see By
     */
    public static final Map<String, Function<String, By>> LOCATOR_MAP = new HashMap<String, Function<String, By>>() {{
        put("id", By::id);
        put("xpath", By::xpath);
        put("css selector", By::cssSelector);
        put("tag name", By::tagName);
        put("name", By::name);
        put("class name", By::className);
        put("link text", By::linkText);
        put("partial link text", By::partialLinkText);
    }};
}