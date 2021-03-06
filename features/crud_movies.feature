Feature: display list of movies filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

Background: movies have been added to database

  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |


  
Scenario: link for creating a movie
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the new movie page

Scenario: create new movie
  Given I am on the new movie page
  When I fill in "Title" with "Inception"
  And I select "R" from "Rating"
  And I press "Save Changes"
  Then I should see "Inception was successfully created"

Scenario: delete a movie
  Given I am on the details page for "Chicken Run"
  When I press "Delete"
  Then I should be on the home page
  And I should see "Movie 'Chicken Run' deleted"
