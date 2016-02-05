Feature: Merge Articles
  As a blog administrator
  In order to avoid multiple similar articles
  I want to be able to merge two articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And the following articles exist:
    | id | title    | author    | body        |
    | 3  | Foobar   | Unknown   | LoremIpsum  |
    | 4  | Foobar2  | Unknown2  | LoremIpsum2 |
    And the following comments exist:
    | id | title    | author  | body  | article_id |
    | 1  | Comment  | author1 | body1 | 3          |
    | 2  | Comment2 | author2 | body2 | 4          |

  Scenario: Successfully merge articles
    Given I am on the article page for "Foobar"
    And show me the page
    And I fill in "merge_with" with "4"
    And I press "Merge"
    Then the article "Foobar" should have body "LoremIpsumLoremIpsum2"
    And the article "Foobar" should have the author "Unknown"
    And the comment "Comment2" belongs to "Foobar" article
    And show me the page