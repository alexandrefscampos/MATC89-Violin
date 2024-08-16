Feature: Buscar Álbuns por Nome
  As a user
  I want to search for albums by name
  So that I can quickly find albums I want to mark as listened or review

  Scenario: Successfully searching for an album by name
    Given I am logged into the application
    When I enter the name of an album into the search bar
    And I submit the search
    Then I should see a list of albums matching the name I entered
    And each album in the results should display its cover art and name

