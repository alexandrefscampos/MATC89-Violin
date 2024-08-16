Feature: Marcar Álbum como Escutado
  As a user
  I want to mark an album as listened
  So that I can keep track of the albums I've listened to

  Scenario: Successfully marking an album as listened
    Given I am logged into the application
    And I have navigated to an album's details page
    When I select the option to mark the album as listened
    Then the album should be added to my list of listened albums
    And the album should be marked as "Listened" in the album's details page

