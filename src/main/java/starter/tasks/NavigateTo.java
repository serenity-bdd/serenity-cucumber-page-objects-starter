package starter.tasks;

import net.serenitybdd.screenplay.actions.Open;
import net.serenitybdd.screenplay.actors.OnStage;

import static starter.tasks.security.CredentialManager.getCredential;

public class NavigateTo {
    /**
     * Navigates the specified actor to the given website URL.
     *
     * @param  url   the URL of the website to navigate to
     * @param  actor the name of the actor performing the navigation
     */
    public static void theWebSite(String url, String actor) {
        OnStage.theActorCalled(actor).attemptsTo(Open.url(getCredential(url, false)));
    }
}
