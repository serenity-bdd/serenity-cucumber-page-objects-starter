package starter.selectors.pages;

import org.openqa.selenium.By;
import starter.selectors.factory.AbstractPage;

import java.util.Map;

import static starter.Constants.*;

public class LoginPage extends AbstractPage {
    /**
     * Returns a Login map of selectors for different elements on the page.
     *
     * @return         a map containing selectors for various elements
     */
    @Override
    public Map mapSelectors() {
        mapSelectors.put(LOGIN, By.cssSelector("fieldset[id*='fieldset']"));
        mapSelectors.put("bad url", By.cssSelector("fieldset[id*='fieldset']"));
        mapSelectors.put("bad url folder", By.id("article"));
        mapSelectors.put("retry", By.cssSelector("#article > div > p:nth-child(2) > a"));
        mapSelectors.put("username", By.name("username"));
        mapSelectors.put("password", By.name("password"));
        mapSelectors.put("validate", By.cssSelector("a[id*='button']"));
        mapSelectors.put("error", By.cssSelector("table[id*='messagebox']:first-of-type"));
        mapSelectors.put("ok", By.cssSelector("div[id*='messagebox'] :first-of-type > a:first-of-type"));
        mapSelectors.put("x", By.cssSelector("div[id*='messagebox'] :first-of-type > div[id*='tool']:first-of-type"));
        return mapSelectors;
    }
}
