require File.expand_path('../config/application', __FILE__)

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

Rails.application.load_tasks
task default: :spec
