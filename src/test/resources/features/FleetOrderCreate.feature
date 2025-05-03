Feature: Fleet Order Creation
  As a fleet manager
  I want to create new fleet orders
  So that I can manage vehicle orders in the system

  Background:
    Given I am on the Fleet Order Create page
    When I enter username "ishmael.direro@korridor.com"
    And I enter password "Ish@cyest#982"
    And I click Remember Me checkbox
    And I click Login button
    Then I should be redirected to Dashboard
    When I select Demo Tenant from dropdown

  Scenario: Create a new fleet order successfully
    Given I am on the Orders page
    When I click Create Order button
    And I enter Order ID "ORD001"
#    Then I should see the new order created successfully
