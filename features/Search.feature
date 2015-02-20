Feature: USAT Search

  @search
  Scenario: Search
    Given Go to Mobile Site
    And Click the Menu button
    And I click on search button
    When Entering "Brian Williams" as search criteria
    Then I should see "Brian Williams" articles