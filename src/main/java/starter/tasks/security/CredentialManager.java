package starter.tasks.security;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class CredentialManager {

    /**
     * Declaration of a static final Properties object.
     */
    private static final Properties properties = new Properties();

    /**
     * Static block to load properties from the config file.
     */
    static {
        try {
            // Load the properties file
            properties.load(new FileInputStream("src/test/resources/config.properties"));
        } catch (IOException e) {
            throw new RuntimeException("Error loading the credentials file", e);
        }
    }

    /**
     * Get the specified credential.
     *
     * @param credentialName Name of the credential to retrieve
     * @param useAwsSecrets Indicates whether AWS Secrets Manager should be used to retrieve the credential (not used in this case)
     * @return The value of the retrieved credential
     * @throws RuntimeException If an error occurs during credential retrieval
     */
    public static String getCredential(String credentialName, boolean useAwsSecrets) {
        // Check if useAwsSecrets is true and throw an exception if it is (not implemented)
        if (useAwsSecrets) {
            throw new UnsupportedOperationException("AWS credential retrieval not yet implemented");
        }

        // Get the credential from the properties file
        String credentialValue = properties.getProperty(credentialName);
        if (credentialValue == null) {
            credentialValue=credentialName;
        }
        return credentialValue;
    }
}