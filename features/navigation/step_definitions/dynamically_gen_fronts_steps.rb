When(/^I capture the menu top sections$/) do

  $section_links = find(".menu-nav-list").all("a").collect(&:text)

end

Then(/^I navigate to each top section and relevant front appears$/) do
  puts $section_links #Checking what has been captured into the global array
end

Then(/^I navigate to each subsection and relevant front appears$/) do

  # require 'debug'
  find('.nav-item-link', :text => $section_links[3]).click
  $subsection_links = all(".subsection-nav span").collect(&:text)
  # require 'debug'
  sub = all('.subsection-nav')
  href = sub.find('.subsection-item a')

  puts $subsection_links
  puts href["href"]
end
