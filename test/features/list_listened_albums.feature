Feature: Listar Álbuns Escutados
  As a user
  I want to see a list of albums I have listened to
  So that I can review the details of albums I've previously listened to

  Scenario: Successfully viewing the list of listened albums
    Given I am logged into the application
    And I have listened to at least one album
    When I navigate to my profile page
    Then I should see a list of albums I have marked as listened
    And the list should be ordered with the most recently listened albums at the top
    And each album should display its cover art and name

