package Runner;


import io.cucumber.junit.CucumberOptions;
import net.serenitybdd.cucumber.CucumberWithSerenity;
import org.junit.runner.RunWith;

@RunWith(CucumberWithSerenity.class)
@CucumberOptions(
        features = "src/test/resources/features/FleetOrderCreate.feature", // Directory-level for multiple features
        glue = "stepsDefinitons",           // Step definitions package
        monochrome = false,                      // Cleaner console output
        plugin = {
                "pretty",                       // Readable output in console
                "html:target/cucumber-html-report", // Generate HTML report
                "json:target/cucumber.json",   // Generate JSON report for external integration
                "junit:target/cucumber.xml"    // Generate JUnit XML for CI tools
        },
        // tags = "@Smoke or @Regression",         // Enables running specific tagged tests
        publish = true                          // Publishes results to cucumber cloud (optional)
        // dryRun = false                       // Uncomment for debugging mappings
)
public class RunnerUITests {
    // Empty body, as the configuration is sufficient to execute tests
}
