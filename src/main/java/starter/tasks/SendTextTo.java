package starter.tasks;

import io.cucumber.datatable.DataTable;
import net.serenitybdd.screenplay.actions.Clear;
import net.serenitybdd.screenplay.actions.Enter;
import net.serenitybdd.screenplay.actors.OnStage;
import starter.selectors.factory.PageFactory;

import java.util.List;

import static starter.tasks.security.CredentialManager.getCredential;

public class SendTextTo {
    /**
     * Input the given text into the specified element.
     *
     * @param text    the text to input
     * @param element the element to input the text into
     */
    public static void input(String text, String element) {
        // Clear the specified element
        OnStage.theActorInTheSpotlight().attemptsTo(
                Clear.field(PageFactory.getCurrentPage().getSelector(element)),
                // Enter the given text into the specified element
                Enter.theValue(text).into(PageFactory.getCurrentPage().getSelector(element))
        );
    }

    /**
     * Input the given credential into the specified element.
     *
     * @param text    the text to input
     * @param element the element to input the text into
     */
    public static void credential(String text, String element) {
        // Retrieve the credential value and send the credential value into the specified element
        input(getCredential(text, false),element);
    }

    /**
     * Iterates through the rows of a DataTable and calls the input method with the elements of each row.
     *
     * @param table the DataTable to iterate through
     */
    public static void table(DataTable table) {
        // Use a DataTable to iterate through the rows
        for (List<String> row : table.asLists(String.class)) {
            // Call the input method with the elements of each row
            input(row.get(1), row.get(0));
        }
    }
}
