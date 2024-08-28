Feature: Marcar Álbum como Escutado
  As a user
  I want to mark an album as listened
  So that I can keep track of the albums I've listened to

  Scenario: Marking an album as successfully listened to from the album details
    Given I am logged into the application as "Reynan Paiva"
    And I have navigated to an album's details page
    When I select the option to mark the album "Thriller" as listened
    Then the album "Thriller" should be added to my list of listened albums
    And the album should be marked as "Listened" in the album's details page

  Scenario: Successfully marking an album as listened after searching for it
    Given I am logged into the application as "Reynan Paiva"
    And I have searched for the album "Abbey Road"
    And I have navigated to the album's details page from the search results
    When I select the option to mark the album as listened
    Then the album "Abbey Road" should be added to my list of listened albums
    And the album should be marked as "Listened" in the album's details page
