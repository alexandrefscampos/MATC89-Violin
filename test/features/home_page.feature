Feature: Home Page
    As a user
    I want to open the app and see my home page
    So that I can view my personal information and added albums
    Scenario: Viewing personal information and added albums on the home page

    When I open the app 
    Then I should see the text "Hello, Reynan Paiva!"
    And I should see the text "Review or track albums you've watched..."
    And I should see the text "Your albums"
    And I should see the names of the 3 albums and its artits I've added and