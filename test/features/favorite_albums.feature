Feature: Favoritar Álbuns
  As a user
  I want to favorite an album
  So that I can easily find and listen to my favorite albums again

  Scenario: Successfully favoriting an album
   Given I am logged into the application as "Reynan Paiva" 
   And I am viewing the details of the album "Thriller" by Michael Jackson 
   When I select the option to favorite the album Then the album "Thriller" should be added to my list of favorite albums 
   And I should see a favorite icon indicating the album is favorited
