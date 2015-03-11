@usat-mweb-homefront-layout
Feature: Home Front Layout Validation

  @usat-mweb-inline-stories
  Scenario: Validate the inline stories
    Given Go directly to "/" front
    Then Validate each section area has 3 inline stories on the Home Front
