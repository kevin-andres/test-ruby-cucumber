require "./dsl/lib/rspec/custom_formatter"

config = RSpec.configuration

config.color_enabled = true
documentation_formatter = config.send(:built_in_formatter, :documentation).new(config.output)
custom_formatter = CustomFormatter.new(File.open("./target/spec-run-result.html", "w"))
config.instance_variable_set(:@reporter, RSpec::Core::Reporter.new(documentation_formatter, custom_formatter))