package starter.selectors.factory;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

public class SelectorFactoryProvider {

    private static final Map<String, SelectorFactory> FACTORIES = new HashMap<>();
    /**
     * A map of SelectorFactory instances, keyed by the type of factory.
     */

    static {
        FACTORIES.put("yaml", new YamlFactory());
        //FACTORIES.put("page", new PageFactory());
    }

    /**
     * Returns an instance of SelectorFactory based on the type of factory requested.
     *
     * @param type the type of factory requested
     * @return an instance of SelectorFactory
     * @throws IllegalArgumentException if an unsupported factory type is requested
     */
    public static SelectorFactory getFactory(String type) {
        return Optional.ofNullable(FACTORIES.get(type))
                .orElseThrow(() -> new IllegalArgumentException("Unsupported selector factory type: " + type));
    }
}