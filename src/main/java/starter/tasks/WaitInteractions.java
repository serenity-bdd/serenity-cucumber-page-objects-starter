package starter.tasks;

import net.thucydides.core.pages.PageObject;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import starter.selectors.factory.PageFactory;

import java.time.Duration;

public class WaitInteractions extends PageObject {

    /**
     * Waits for a WebElement to be present on the page.
     *
     * @param  element the WebElement to wait for
     * @return         the WebElement that was found
     */
    public WebElement waitElementIsPresent(WebElement element) {
        WebDriverWait wait = new WebDriverWait(getDriver(), Duration.ofSeconds(10), Duration.ofSeconds(1));
        return wait.until(ExpectedConditions.presenceOfElementLocated(PageFactory.getWebElementSelector(element)));
    }

    /**
     * A description of the entire Java function.
     *
     * @param  element the WebElement to wait for
     * @return         the WebElement that was found
     */
    public WebElement waitElementVisible(WebElement element) {
        WebDriverWait wait = new WebDriverWait(getDriver(), Duration.ofSeconds(10), Duration.ofSeconds(1));
        return wait.until(ExpectedConditions.visibilityOf((element)));
    }
}
