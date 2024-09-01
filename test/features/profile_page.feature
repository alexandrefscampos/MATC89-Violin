Feature: Profile Page Information
    Scenario: Viewing main information on the profile page
        When I navigate to my profile page
        Then I see {'Reynan Paiva'} text
        And I see {'Total albums'} text
        And I see {'10'} text
        And I see {'Albums this year'} text
        And I see {'5'} text
        And I see {'Lists'} text
        And I see {'3'} text
        And I see {'Reviews'} text
        And I see {'2'} text