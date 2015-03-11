@usat-fronts-dynamic
Feature: Navigate to all sections and subsections

  Background: Pre-conditions
    Given Go directly to "/" front
      And Click the Menu button

  @usat-top-sections-dynamic
  Scenario: Navigate to all top sections
    When I capture the menu top sections
    Then I navigate to each top section and relevant front appears

  @usat-subsections-dynamic
  Scenario: Navigate to all subsections
    When I capture the menu top sections
    Then I navigate to each subsection and relevant front appears