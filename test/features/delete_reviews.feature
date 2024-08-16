Feature: Excluir Avaliações
  As a user
  I want to delete a review I've written
  So that I can remove reviews I no longer want to keep

  Scenario: Successfully deleting a review
    Given I am logged into the application
    And I have written a review for an album
    When I choose to delete the review
    Then the review should be removed from the album's details page
    And a confirmation message should be displayed

