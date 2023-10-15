package starter.stepdefinitions;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import net.serenitybdd.annotations.Steps;
import starter.actions.NavigateSteps;
import starter.actions.SearchSteps;

import static org.assertj.core.api.Assertions.assertThat;

public class SearchStepDefinitions {

    @Steps
    NavigateSteps navigate;

    @Steps
    SearchSteps search;

    @Given("^(?:.*) is researching things on the internet")
    public void researchingThings() {
        navigate.opensTheHomePage();
    }

    @When("^(?:.*) looks up \"(.*)\"")
    public void searchesFor(String term) {
        search.searchForTerm(term);
    }

    @Then("^(?:.*) should see information about \"(.*)\"")
    public void should_see_information_about(String term) {
        assertThat(search.getSearchResults()).anyMatch(title -> title.toLowerCase().contains(term));

    }
}
