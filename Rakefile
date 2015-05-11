require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'


namespace :features do

  Cucumber::Rake::Task.new(:local) do |t|
    t.profile = 'local'
  end

  task :ci => [:local]
end
