require 'yaml'
require 'hash-to-ostruct'
require './dsl/lib/helper'
require './dsl/lib/drivers/web_driver'

module CogBurn
  class DslProxy
    attr_accessor :helper, :web_app, :mobile_web_app, :android_app, :ios_app, :config, :test_data
    def initialize file="./config.yaml"
      @config = (YAML.load_file file).to_ostruct
      @test_data = (YAML.load_file @config.test_data).to_ostruct
      @helper = CogBurn::Helper.new @config
    end

    def initialize_web_driver
      @web = CogBurn::Drivers::WebDriver.new @config
    end

    def initialize_android_driver
      @android_app = CogBurn::Drivers::AndroidDriver.new @config
    end
  end # class DslProxy
end # module CogBurn