require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'
require 'csv'

include Capybara::DSL
Capybara.default_driver = :poltergeist

# local variables
section_hrefs = []
subsection_hrefs = []


base_url = "http://mhigh.usatoday.com"

visit(base_url)
find('.menu-toggle-btn.main-nav-btn').click

all('.menu-nav-list .menu-nav-item').each do |section_link|
  s_href = section_link.find('.nav-item-link')["href"]

  section_hrefs << {
      href: s_href
  }

end

puts section_hrefs


visit "http://mhigh.usatoday.com" + "/news/"

all('.subsection-nav .subsection-item').each do |subsection_link|
  sub_href = subsection_link.find('.subsection-nav-link')["href"]

  subsection_hrefs << {
      href: sub_href
  }

end

# Print
puts subsection_hrefs