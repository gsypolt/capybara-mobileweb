Given(/^Go to Mobile Site$/) do
  visit ui_url('/')
end

When(/^Go directly to "(.*?)" front$/) do |href|

  if href == 'http://fantasy.usatoday.com'
    visit(href)
  elsif href == 'http://spanningthesec.com/'
    visit(href)
  elsif href == 'http://fanindex.usatoday.com/'
    visit(href)
  else
    visit ui_url(href)
  end

end
