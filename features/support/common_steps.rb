Given(/^Go directly to "(.*?)" front$/) do |href|
  if href.include? "://"
    visit(href)
  else
    visit ui_url(href)
  end
end
