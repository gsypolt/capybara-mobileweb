require 'rspec/expectations'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'timeout'
require 'pry'

# Tip for developing productively when using Cucumber. Simple way to pause cucumber scenarios in order to
# investigate the current state of your application at that point. This method you will able to go through a
# scenario step-by-step using @pause tag.

AfterStep('@pause') do
  print "Press Return to continue..."
  STDIN.getc
end

$base_url = ENV["ACCEPTANCE_TEST_HOST"] || "http://mhigh.usatoday.com"
Capybara.app_host = $base_url


if ENV['HEADLESS']
  require 'capybara/poltergeist'
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(
        app,
        window_size: [1280, 1024]#,
        #debug:       true
    )
  end
  Capybara.default_driver    = :poltergeist
  Capybara.javascript_driver = :poltergeist
else
  if ENV['LOCAL']
    Capybara.default_driver = :selenium
    require 'pry'
  else
    require 'selenium'
    require_relative 'extensions/fast-selenium'
    caps = Selenium::WebDriver::Remote::Capabilities.new

    # Debugging Browserstack
    # caps['browserstack.debug'] = true

    if ENV['BS_IOS']
      # iOS Real Device Browser
      caps[:browserName] = 'iPhone'
      caps[:platform] = 'MAC'
      caps['device'] = 'iPhone 5S'
    elsif ENV['BS_ANDROID']
      # Android Emulator Browser
      caps[:browserName] = 'android'
      caps[:platform] = 'ANDROID'
      caps['device'] = 'Samsung Galaxy S5'
    else
      # Desktop Browser
      caps['browser'] = 'Firefox'
      caps['os'] = 'Windows'
      caps['os_version'] = "8"
      caps['resolution'] = '1280x1024'
    end

    client = Selenium::WebDriver::Remote::Http::Default.new
    client.timeout = 120
    Capybara.default_driver = :selenium
    Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app,
                                     :browser => :remote,
                                     :url => (ENV["SELENIUM_HOST"] or "http://add_browser_stack_apikey@hub.browserstack.com/wd/hub"),
                                     :desired_capabilities => caps,
                                     :http_client => client)
    end
  end
end

AfterStep("~@popover") do
  # Close any transition ads which may have opened
  # so as not to interfere with the test in progress.
  ad = first(".partner-overlay-close")
  ad.click unless ad.nil?
end


Capybara.default_wait_time = 90
Capybara.default_selector = :css
World(RSpec::Matchers)

def ui_url(path)
  build_qpm = ""
  if !path.include? "build_number"
    if path.include? "?"
      build_qpm = "&build_number=" + ENV['BUILD_NUMBER'].to_s
    else
      build_qpm = "?build_number=" + ENV['BUILD_NUMBER'].to_s
    end
  end
  if !path.include? "://"
    $base_url.to_s + path + build_qpm
  else
    path + build_qpm
  end
end

def validate_url(page_url)
  url = URI.parse(page_url)
  req = Net::HTTP::Get.new(url)
  res = Net::HTTP.start(url.host, url.port) do |http|
    http.request(req) # Perform the GET request.
  end
  if res.code.to_i.between?(300, 303)
    # We've nailed a redirect, so grab the location string
    # provided in the response and validate it instead.
    validate_url (res.get_fields "location").first
  else
    expect(res.code.to_s).to match("200")
  end
end

def wait_for_pageload(reloads=0)
  start = Time.now
  page_ready = false
  find('body')
  while !page_ready
    begin
      page.execute_script("require(['admanager','managers/requestmanager','managers/trafficcop'],function(AdManager, RequestManager, TrafficCop){ window.page_ready = TrafficCop.getAnimationCompletion().state() === 'resolved' && RequestManager.done().state() === 'resolved' && AdManager.isPageLoaded() == true; })")
    rescue
    end
    page_ready = page.execute_script("return window.page_ready")
    break if page_ready == true
    if Time.now > start + Capybara.default_wait_time
      if reloads >= 3
        fail "The page wasn't ready - either it never loaded, never finished animating or requests never finished"
      else
        visit ui_url(current_url)
        wait_for_pageload(reloads + 1)
      end
    end
    sleep 0.5
  end
end

def wait_for_animations()
  start = Time.now
  animations_complete = false
  find('body')
  while !animations_complete
    begin
      page.execute_script("require(['managers/trafficcop'],function(TrafficCop){ window.animations_complete = TrafficCop.getAnimationCompletion().state() === 'resolved' })")
    rescue
    end
    animations_complete = page.execute_script("return window.animations_complete")
    break if animations_complete
    if Time.now > start + Capybara.default_wait_time
      fail "Animations did not complete"
    end
    sleep 0.5
  end
end
