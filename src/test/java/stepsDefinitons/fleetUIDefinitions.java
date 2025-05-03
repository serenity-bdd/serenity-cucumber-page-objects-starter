package stepsDefinitons;

import PageObject.fleetOrderCreate;


import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import net.serenitybdd.annotations.Steps;
import net.serenitybdd.core.pages.PageObject;

public class fleetUIDefinitions extends PageObject {

    public fleetUIDefinitions() {
        super();
    }

    @Steps
    fleetOrderCreate fleetOrderCreate;


    @Given("I am on the Fleet Order Create page")
    public void iAmOnTheFleetOrderCreatePage() {
        fleetOrderCreate.TMSWebsite();
        fleetOrderCreate.LogInUserName("");

    }

    @When("I enter username {string}")
    public void iEnterUsername(String arg0)
    {
        fleetOrderCreate.LogInUserName("ishmael.direro@korridor.com");

    }

    @And("I enter password {string}")
    public void iEnterPassword(String arg0) {
        fleetOrderCreate.LogInPassword("Ish@cyest#982");
    }
    @And("I click Remember Me checkbox")
    public void iClickRememberMeCheckbox() {
        fleetOrderCreate.RememberMe();
    }
    @And("I click Login button")
    public void iClickLoginButton() {
        fleetOrderCreate.ClickLoginButton();
    }

    @Then("I should be redirected to Dashboard")
    public void iShouldBeRedirectedToDashboard() {
        fleetOrderCreate.dashboard();
    }

    @When("I select Demo Tenant from dropdown")
    public void iSelectDemoTenantFromDropdown() {
        fleetOrderCreate.SelectDemo();
    }

    @Given("I am on the Orders page")
    public void iAmOnTheOrdersPage() {
        fleetOrderCreate.OrderClick();
    }

    @When("I click Create Order button")
    public void iClickCreateOrderButton() {
        fleetOrderCreate.OrderCreate();
    }

    @And("I enter Order ID {string}")
    public void iEnterOrderID(String arg0) {
        fleetOrderCreate.OrderId(arg0);
    }

    @Then("I should see the new order created successfully")
    public void iShouldSeeTheNewOrderCreatedSuccessfully() {
    }



}
