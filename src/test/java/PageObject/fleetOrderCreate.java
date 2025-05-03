package PageObject;

import net.serenitybdd.annotations.Step;
import net.serenitybdd.core.pages.PageObject;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.util.Objects;

public class fleetOrderCreate extends PageObject {

    // Browser types
    public static final String CHROME = "chrome";
    public static final String FIREFOX = "firefox";


    // Login IN elements
    String Url = "https://korridor.crownsoftware.co.za/";
    String DashboardUrlXpath = "https://korridor.crownsoftware.co.za/dashboard";
    String DashboardMenuXpath = "//a[@href='/dashboard']";
    String UserNameXpath = "//input[@id='Input_Email']";
    String PasswordXpath = "//input[@id='Input_Password']";
    String RememberMeXpath = "//input[@type='checkbox']";
    String LoginButtonXpath = "//button[normalize-space()='Log In']";

    // Landing Page Elements

    String TenantDropXpath = "//select[@name='tenantId']";

    String OrderClickXpath = "//li[@class='active']//a";
    String OrderCreateXpath = "(//a[normalize-space()='Create Order'])[1]";
    String OrderIdXpath = "//input[@placeholder='Order Id...']";
    String CustomerXpath = "";

    //Action Login Tests

    public fleetOrderCreate(WebDriver driver) {
        super(driver);
    }


    // Initializing browser
    public static WebDriver setupBrowser(String browserType) {
        WebDriver driver;
        if (browserType.equalsIgnoreCase(CHROME)) {
            driver = new ChromeDriver();
        } else if (browserType.equalsIgnoreCase(FIREFOX)) {
            driver = new FirefoxDriver();
        } else {
            throw new IllegalArgumentException("Browser type not supported: " + browserType);
        }
        driver.manage().window().maximize();
        return driver;
    }


    @Step("User access Fleet Website ")
    public void TMSWebsite () {
            getDriver().get(Url);
            getDriver().manage().window().maximize();
        }
    public void LogInUserName (String UserName) {

            WebDriverWait wait = new WebDriverWait(getDriver(), Duration.ofSeconds(5));
            wait.until(ExpectedConditions.elementToBeClickable(By.xpath(UserNameXpath))).sendKeys(UserName);

        }
     public void LogInPassword (String Password) {

        WebDriverWait wait = new WebDriverWait(getDriver(), Duration.ofSeconds(5));
        wait.until(ExpectedConditions.elementToBeClickable(By.xpath(PasswordXpath))).sendKeys(Password);

        }

     public void RememberMe () {
        WebDriverWait wait = new WebDriverWait(getDriver(), Duration.ofSeconds(5));
        wait.until(ExpectedConditions.elementToBeClickable(By.xpath(RememberMeXpath))).click();

        }

     public void ClickLoginButton () {

            WebDriverWait wait = new WebDriverWait(getDriver(), Duration.ofSeconds(0));
            wait.until(ExpectedConditions.elementToBeClickable(By.xpath(LoginButtonXpath))).click();
        }

        public void SelectDemo () {
            WebDriverWait wait = new WebDriverWait(getDriver(), Duration.ofSeconds(5));
            WebElement demo = wait.until(ExpectedConditions.elementToBeClickable(By.xpath(TenantDropXpath)));
            Select selectObject = new Select(demo);
            selectObject.selectByValue("1");
        }
        
        public void dashboard () {
            WebDriverWait wait = new WebDriverWait(getDriver(), Duration.ofSeconds(5));
            wait.until(ExpectedConditions.elementToBeClickable(By.xpath(DashboardMenuXpath))).click();

        }

        public void OrderClick(){
            WebDriverWait wait = new WebDriverWait(getDriver(), Duration.ofSeconds(5));
            wait.until(ExpectedConditions.elementToBeClickable(By.xpath(OrderClickXpath))).click();
        }

        public void OrderCreate(){
            WebDriverWait wait = new WebDriverWait(getDriver(), Duration.ofSeconds(5));
            wait.until(ExpectedConditions.elementToBeClickable(By.xpath(OrderCreateXpath))).click();

        }
        public void OrderId(String idNUmber){
            WebDriverWait wait = new WebDriverWait(getDriver(), Duration.ofSeconds(5));
            wait.until(ExpectedConditions.elementToBeClickable(By.xpath(OrderIdXpath))).sendKeys(idNUmber);
        }

    }

