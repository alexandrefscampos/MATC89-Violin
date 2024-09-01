Feature: Delete Reviews
    As a user
    I want to delete a review I've written
    So that I can remove reviews I no longer want to keep
    
    Scenario: Successfully deleting a review
        When I navigate to album review
        Then I see {'muito ruim'} text
        And I delete review
