Feature: Visualizar Informações na Página de Perfil
  As a user
  I want to view relevant information on my profile page
  So that I can track my listened albums, written reviews, and favorited albums

  Scenario: Viewing main information on the profile page
    Given I am logged into the application as "Reynan Paiva"
    When I navigate to my profile page
    Then I should see my username "john_doe" displayed
    And I should see the text "Total albums: 10"
    And I should see the text "Favorite albums: 5"
    And I should see the text "Reviews: 3"
    And I should see the text "Lists"
