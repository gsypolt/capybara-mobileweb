Feature: USAT Videos & Photos


  @videos_photos @filter_only
  Scenario Outline: Filter by Videos Only
    When Go directly to "<href>" front
    And Filter "<filter_type>" from Media Type Overlay
    Then I should see "<filter_type>" heading
    And I should see only "<filter_type>" on the page

  Examples:
    | href    | filter_type |
    | /media/ | Videos      |
    | /media/ | Photos      |

  @videos_photos @filter_all
  Scenario: Filter by All Types
    When Go directly to "/media/" front
    And Filter "All" from Media Type Overlay
    Then I should see "Videos & Photos" heading
    And I should see both videos and photos on the page