Feature: Avaliar Álbuns
  As a user
  I want to review and rate albums
  So that I can express my opinion on the albums I've listened to

  Scenario: Successfully reviewing and rating an album
    Given I am logged into the application
    And I have navigated to an album's details page
    When I write a review and give a rating of 4 stars
    And I submit the review
    Then my review should be visible on the album's details page
    And it should display my username, the review content, and the 4-star rating

