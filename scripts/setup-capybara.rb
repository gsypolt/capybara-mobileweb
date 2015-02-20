# Require the gems
require 'capybara'
require 'capybara/dsl'
require 'capybara/poltergeist'

# Configure Poltergeist to not blow up on websites with js errors aka every website with js
# See more options at https://github.com/teampoltergeist/poltergeist#customization
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end

include Capybara::DSL

# Configure Capybara to use Poltergeist as the driver
Capybara.default_driver = :poltergeist


base_url = "http://mhigh.usatoday.com/news/"

visit(base_url)
# require 'pry'; binding.pry

all('a.inline-item').each do |validate_inline_stories|

    current = validate_inline_stories['href']
    puts validate_inline_stories.text, current, ""

end