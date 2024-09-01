Feature: Album Search
    As a user
    I want to search for albums
    So that I can find and add them to my collection
Scenario: Searching for an album
    Given I am logged in as "Reynan Paiva"
    When I navigate to the search page
    And I enter "Thriller" into the search field
    And I tap the search button
    Then I should see a list containing an album called "Thriller"