# rspec and cucumber gem
require 'rspec/core/rake_task'
require 'rake/clean'
require 'cucumber'
require 'cucumber/rake/task'

# colorize gem for console pretty print
require 'colorize'

# ci-reporter gem
#require 'ci/reporter/rake/rspec'
require 'ci/reporter/rake/cucumber'

# CI Reports target folder
ENV['CI_REPORTS'] = "./target"

RSpec::Core::RakeTask.new("spec") do |t|
  t.pattern = "./specs/**/*_spec.rb"
  t.rspec_opts = ["--require","./dsl/lib/rspec/format.rb"]
end

RSpec::Core::RakeTask.new("run:specs") do |t|
  t.pattern = "./specs/**/*_spec.rb"
  t.rspec_opts = ["--require","./dsl/lib/rspec/format.rb"]
end

RSpec::Core::RakeTask.new("ci:run:specs") do |t|
  t.pattern = "./specs/**/*_spec.rb"
  t.rspec_opts = ["--format","CI::Reporter::RSpec"]
end

Cucumber::Rake::Task.new("feature") do |t|
  t.cucumber_opts = %w{--format pretty --format html --out ./target/feature-run-report.html}
end

Cucumber::Rake::Task.new("run:features") do |t|
  t.cucumber_opts = %w{--format pretty --format html --out ./target/feature-run-report.html}
end

Cucumber::Rake::Task.new("ci:run:features") do |t|
  t.cucumber_opts = %w{--format CI::Reporter::Cucumber}
end

# clean task
directory 'target/'
CLEAN.add 'target'

task :target => 'target/'

task :spec => :target
task "run:specs" => :target
task "ci:run:specs" => :target

task :feature => :target
task "run:features" => :target
task "ci:run:features" => :target

task :default => [:info]

task :info do
  puts "== CogBurn Info =="
  puts "To run specs use: " + "$>rake run:specs".yellow
  puts "To run features use: " + "$>rake run:features".yellow
  puts "For CI use: "
  puts "    $>rake ci:run:specs".yellow
  puts "    $>rake ci:run:features".yellow
  puts ""
end