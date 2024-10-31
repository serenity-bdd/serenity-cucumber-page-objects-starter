package starter.tasks;


import net.serenitybdd.core.Serenity;
import net.thucydides.core.pages.PageObject;
import starter.selectors.factory.PageFactory;

public class IsLoad extends PageObject {
    /**
     * A description of the entire Java function.
     *
     * @param  pageName	description of parameter
     * @return         	description of return value
     */
    public static void isLoadPage(String pageName) {
        PageFactory.setCurrentPage(pageName);
        Serenity.recordReportData().withTitle("visible page: ").andContents(pageName);
        ElementVisibilityVerifier.verifyElementIsVisible(pageName);
    }
}
