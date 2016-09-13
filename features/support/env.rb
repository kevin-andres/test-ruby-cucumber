require 'hash-to-ostruct'
require 'rspec/expectations'
require './dsl/domain_specific_language'

World(RSpec::Matchers)

app = DSL::DomainSpecificLanguage.new

Before do
  @app = app
end

at_exit do
  app.quit
end