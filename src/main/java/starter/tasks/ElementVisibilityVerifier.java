package starter.tasks;

import net.serenitybdd.screenplay.GivenWhenThen;
import net.serenitybdd.screenplay.actors.OnStage;
import net.serenitybdd.screenplay.matchers.WebElementStateMatchers;
import net.serenitybdd.screenplay.questions.Text;

import static net.serenitybdd.screenplay.questions.Text.*;
import static net.serenitybdd.screenplay.matchers.WebElementStateMatchers.isNotVisible;
import static net.serenitybdd.screenplay.questions.WebElementQuestion.*;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.hasValue;
import static starter.selectors.factory.PageFactory.*;

public class ElementVisibilityVerifier {
    /**
     * Verifies if the given web element is visible
     *
     * @param element The element to be verified
     */
    public static void verifyElementIsVisible(String element) {
        // Use the actor in the spotlight to check if the element is visible
        OnStage.theActorInTheSpotlight().should(
                "check that the element is visible: " + element,
                GivenWhenThen.seeThat(
                        // Get the web element using the selector for the current page
                        the(getCurrentPage().getSelector(element)),
                        WebElementStateMatchers.isVisible()
                ));
    }

    /**
     * Verifies that the given element is not visible on the current page.
     *
     * @param element the element to be verified
     */
    public static void verifyElementIsNotVisible(String element) {
        // Use the actor in the spotlight to check if the element is not visible
        OnStage.theActorInTheSpotlight().should(
                // Provide a description for the verification
                "check that the element is not visible: " + element,
                // Use WebElementQuestion to locate the element and WebElementStateMatchers to check its visibility
                GivenWhenThen.seeThat(
                        the(getCurrentPage().getSelector(element)),
                        isNotVisible()
                ));
    }


    /**
     * Verify if the element text matches the expected name.
     *
     * @param element the element to verify
     */
    public static void verifyElementTextIs(String element, String expectedText) {
        // Use the Actor to verify the element text
        OnStage.theActorInTheSpotlight().should(
                GivenWhenThen.seeThat(
                        "check that the element text matches the expected text",
                        Text.of(getCurrentPage().getSelector(element)),
                        equalTo(expectedText)
                )
        );
    }
}
