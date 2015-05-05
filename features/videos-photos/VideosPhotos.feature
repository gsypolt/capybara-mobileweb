@usat_mweb_media @usat_mweb
Feature: USAT Media Videos & Photos


  @usat_mweb_media_filter_only
  Scenario Outline: Filter by Videos Only
    Given Go directly to "<section_href>" front
    When Filter "<filter_type>" from Media Type Overlay
    Then I should see "<filter_type>" heading
      And I should see only "<filter_type>" on the page

  Examples:
    | section_href  | filter_type |
    | /media/       | Videos      |
    | /media/       | Photos      |

  @usat_mweb_media_filter_all
  Scenario: Filter by All Types
    Given Go directly to "/media/" front
    When Filter "All" from Media Type Overlay
    Then I should see "Videos & Photos" heading
      And I should see both videos and photos on the page
