Feature: Create Category
  As a blog administrator
  In order to give category details for articles
  I want to create a category
  
  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully create categories
    Given I am on the new category page
    When I fill in "category_name" with "Lorem"
    And I fill in "category_keywords" with "Lorem Ipsum"
    And I press "Save"
    Then I should see "Category was successfully saved."
