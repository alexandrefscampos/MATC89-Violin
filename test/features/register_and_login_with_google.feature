Feature: Registro e Login via Conta Google
  As a new user
  I want to register and log in using my Google account
  So that I can access the application quickly and securely

  Scenario: Successfully registering and logging in with Google
    Given I am on the login screen
    When I select the option to log in with Google
    And I successfully authenticate with my Google account
    Then I should be redirected to the home page of the application

