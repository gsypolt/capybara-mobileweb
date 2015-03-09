@usat-fronts
Feature: Navigate to all USAT section and sub-section fronts
  Successfully navigate to each front and validate the relevant front appears.

  @usat-top-sections
  Scenario Outline: Section Fronts
    When Go directly to "<section_href>" front
    Then I should see "<header_class>" front

  Examples:
    | section_href  | header_class                | 
    | /             | .header-logo.header-home    | 
    | /news/        | .header-logo.header-news    | 
    | /sports/      | .header-logo.header-sports  | 
    | /life/        | .header-logo.header-life    | 
    | /money/       | .header-logo.header-money   | 
    | /tech/        | .header-logo.header-tech    | 
    | /travel/      | .header-logo.header-travel  | 
    | /opinion/     | .header-logo.header-opinion | 
    | /weather/     | .header-logo.header-weather | 
    | /media/       | .header-logo.header-media   | 

  @usat-news-subsections
  Scenario Outline: News Subsection Fronts
    When Go directly to "<subsection_href>" front
    Then I should see "<header_class>" front

  Examples:
    | subsection_href   | header_class                        |
    | /news/nation/     | .header-news.header-news-nation     |
    | /news/world/      | .header-news.header-news-world      |
    | /news/politics/   | .header-news.header-news-politics   |
    | /news/elections/  | .header-news.header-news-elections  |

  @usat-sports-subsections
  Scenario Outline: Sports Subsection Fronts
    When Go directly to "<subsection_href>" front
    Then I should see "<header_class>" front

  Examples:
    |subsection_href                | header_class                                                          |
    | /sports/mlb/                  | .header-sports.header-sports-mlb                                      |
    | /sports/mlb/scores/           | .header-sports.header-sports-mlb.header-sports-mlb-scores             |
    | /sports/mlb/standings/        | .header-sports.header-sports-mlb.header-sports-mlb-standings          |
    | /sports/nfl/                  | .header-sports.header-sports-nfl                                      |
    | http://fantasy.usatoday.com   | .section-header.fantasy.branded                                       |
    | /sports/nfl/scores/           | .header-sports.header-sports-nfl.header-sports-nfl-scores             |
    | /sports/nfl/standings/        | .header-sports.header-sports-nfl.header-sports-nfl-standings          |
    | /sports/nba/                  | .header-sports.header-sports-nba                                      |
    | /sports/nba/scores/           | .header-sports.header-sports-nba.header-sports-nba-scores             |
    | /sports/nba/standings/        | .header-sports.header-sports-nba.header-sports-nba-standings          |
    | /sports/nhl/                  | .header-sports.header-sports-nhl                                      |
    | /sports/nhl/scores/           | .header-sports.header-sports-nhl.header-sports-nhl-scores             |
    | /sports/nhl/standings/        | .header-sports.header-sports-nhl.header-sports-nhl-standings          |
    | /sports/ncaaf/                | .header-sports.header-sports-ncaaf                                    |
    | /sports/ncaaf/scores/         | .header-sports.header-sports-ncaaf.header-sports-ncaaf-scores         |
    | /sports/ncaaf/standings/      | .header-sports.header-sports-ncaaf.header-sports-ncaaf-standings      |
    | /sports/ncaaf/polls/          | .header-sports.header-sports-ncaaf.header-sports-ncaaf-polls          |
    | http://spanningthesec.com/    | .section-header.sports-navigation-school.ncaa-sec.branded             |
    | http://fanindex.usatoday.com/ | .section-header.fan-index.branded                                     |
    | /sports/ncaab/                | .header-sports.header-sports-ncaab                                    |
    | /sports/ncaab/scores/         | .header-sports.header-sports-ncaab.header-sports-ncaab-scores         |
    | /sports/ncaab/standings/      | .header-sports.header-sports-ncaab.header-sports-ncaab-standings      |
    | /sports/ncaab/polls/          | .header-sports.header-sports-ncaab.header-sports-ncaab-polls          |
    | /sports/wnba/                 | .header-sports.header-sports-wnba                                     |
    | /sports/wnba/scores/          | .header-sports.header-sports-wnba.header-sports-wnba-scores           |
    | /sports/wnba/standings/       | .header-sports.header-sports-wnba.header-sports-wnba-standings        |
    | /sports/golf/                 | .header-sports.header-sports-golf                                     |
    | /sports/golf/leaderboard/     | .header-sports.header-sports-golf.header-sports-golf-leaderboard      |
    | /sports/golf/schedule/        | .header-sports.header-sports-golf.header-sports-golf-schedule         |
    | /sports/nascar/               | .header-sports.header-sports-nascar                                   |
    | /sports/nascar/results/       | .header-sports.header-sports-nascar.header-sports-nascar-leaderboard  |
    | /sports/nascar/schedule/      | .header-sports.header-sports-nascar.header-sports-nascar-schedule     |
    | /sports/nascar/standings/     | .header-sports.header-sports-nascar.header-sports-nascar-standings    |
    | /sports/fantasy/              | .header-sports.header-sports-fantasy                                  |
    | /sports/mls/                  | .header-sports.header-sports-mls                                      |
    | /sports/mls/scores/           | .header-sports.header-sports-mls.header-sports-mls-scores             |
    | /sports/mls/standings/        | .header-sports.header-sports-mls.header-sports-mls-standings          |
    | /sports/olympics/             | .header-sports.header-sports-olympics                                 |
    | /sports/ncaaw/                | .header-sports.header-sports-ncaaw                                    |

  @usat-life-subsections
  Scenario Outline: Life Subsection Fronts
    When Go directly to "<subsection_href>" front
    Then I should see "<header_class>" front

  Examples:
    | subsection_href                   | header_class                                        |
    | /life/people/                     | .header-life.header-life-people                     |
    | /life/movies/                     | .header-life.header-life-movies                     |
    | /life/music/                      | .header-life.header-life-music                      |
    | /life/tv/                         | .header-life.header-life-tv                         |
    | /life/books/                      | .header-life.header-life-books                      |
    | /life/web-to-watch/               | .header-life.header-life-web-to-watch               |
    | /life/web-to-watch-animation/     | .header-life.header-life-web-to-watch-animation     |
    | /life/web-to-watch-comedy/        | .header-life.header-life-web-to-watch-comedy        |
    | /life/web-to-watch-drama/         | .header-life.header-life-web-to-watch-drama         |
    | /life/web-to-watch-entertainment/ | .header-life.header-life-web-to-watch-entertainment |
    | /life/web-to-watch-tech-gaming/   | .header-life.header-life-web-to-watch-tech-gaming   |
    | /life/web-to-watch-family/        | .header-life.header-life-web-to-watch-family        |

  @usat-money-subsections
  Scenario Outline: Money Subsection Fronts
    When Go directly to "<subsection_href>" front
    Then I should see "<header_class>" front

  Examples:
    | subsection_href                   | header_class                                  |
    | /money/markets/                   | .header-money.header-money-markets            |
    | /money/business/                  | .header-money.header-money-business           |
    | /money/personal-finance/          | .header-money.header-money-personal-finance   |
    | /money/cars/                      | .header-money.header-money-cars               |

  @usat-tech-subsections
  Scenario Outline: Tech Subsection Fronts
    When Go directly to "<subsection_href>" front
    Then I should see "<header_class>" front

  Examples:
    | subsection_href       | header_class                            |
    | /tech/personal-tech/  | .header-tech.header-tech-personal-tech  |
    | /tech/gaming/         | .header-tech.header-tech-gaming         |

  @usat-travel-subsections
  Scenario Outline: Travel Subsection Fronts
    When Go directly to "<subsection_href>" front
    Then I should see "<header_class>" front

  Examples:
    | subsection_href                                                 | header_class                                |
    | /travel/destinations/                                           | .header-travel.header-travel-destinations   |
    | /travel/flights/                                                | .header-travel.header-travel-flights        |
    | /travel/cruises/                                                | .header-travel.header-travel-cruises        |
    | /travel/deals/                                                  | .header-travel.header-travel-deals          |
    | /topic/cb3198f6-3a43-4dfe-8305-992742873b0f/experience-travel/  | .header-experience                          |
    | /travel/roadwarriors/                                           | .header-travel.header-travel-roadwarriors   |
    | /travel/travel-agents/                                          | .header-travel.header-travel-travel-agents  |

  @usat-videos-photos-subsections
  Scenario Outline: Videos & Photos Subsection Fronts
    When Go directly to "<subsection_href>" front
    Then I should see "<header_class>" front

  Examples:
    | subsection_href         | header_class                        |
    | /media/popular/news/    | .header-media.header-media-news     |
    | /media/popular/sports/  | .header-media.header-media-sports   |
    | /media/popular/life/    | .header-media.header-media-life     |
    | /media/popular/money/   | .header-media.header-media-money    |
    | /media/popular/tech/    | .header-media.header-media-tech     |
    | /media/popular/money/   | .header-media.header-media-money    |
    | /media/popular/travel/  | .header-media.header-media-travel   |
    | /media/popular/opinion/ | .header-media.header-media-opinion  |