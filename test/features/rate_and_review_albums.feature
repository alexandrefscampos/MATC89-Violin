Feature: Avaliar Álbuns
  As a user
  I want to review and rate albums
  So that I can express my opinion on the albums I've listened to

  Scenario: Successfully reviewing and rating an album
    Given I am logged into the application as "Reynan Paiva"
    And I have navigated to an album's details page for "Rumours" by Fleetwood Mac
    When I write a review saying "Classic album with great tracks" and give a rating of 4 stars
    And I submit the review
    Then my review should be visible on the album's details page
    And it should display my username, the review content, and the 4-star rating
