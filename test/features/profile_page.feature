Feature: Visualizar Informações na Página de Perfil
  As a user
  I want to view relevant information on my profile page
  So that I can track my listened albums, written reviews, and favorited albums

  Scenario: Visualizando informações principais na página de perfil
    Given I am logged into the application
    When I navigate to my profile page
    Then I should see my username displayed
    And I should see the text "Total albums"
    And I should see the text "Favorite albums"
    And I should see the text "Reviews"
    And I should see the text "Lists"
