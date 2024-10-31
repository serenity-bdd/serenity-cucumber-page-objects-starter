package starter.selectors.factory;

import org.openqa.selenium.By;

public interface SelectorFactory {
    /**
     * Returns a selector by name.
     *
     * @param name the name of the selector
     * @return the selector
     */
    By getSelector(String name);
}