Then(/^I should see "(.*?)" front$/) do |header_front_class|
  expect(page).to have_css(header_front_class)
end
