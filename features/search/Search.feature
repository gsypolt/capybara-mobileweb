@usat_search
Feature: USAT Search

  Scenario: Search
    Given Go directly to "/" front
    And Click the Menu button
    And I click on search button
    When Entering "Brian Williams" as search criteria
    Then I should see "Brian Williams" articles