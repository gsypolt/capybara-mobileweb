Given (/^I click on search button$/) do
  find('.has-nav-search').click
end

When(/^Entering "(.*?)" as search criteria$/) do |search_criteria|
  find('input#userInput-nav').set(search_criteria)
  find('input.entry-property.entry-button.search-submit').click
end

Then(/^I should see "(.*?)" articles$/) do |search_results|
  search_entries_found = find('.search-entries-result').text
  expect(search_entries_found).to match(/^\d{1,}\s\bEntries found for\b/)



  # first_article = find('.inline-item').first
  #
  # puts first_article.text

  # all('.inline-item').each do |search_inline_result|
  #   puts search_inline_result.text
  #
  #
  # end

end