# require all gems here
require 'yaml'
require 'hash-to-ostruct'
require 'selenium-webdriver'
require 'page-object'
require 'page-object/page_factory'

# require utils and framework libs
require './dsl/lib/helper'
require './dsl/web/web_dsl'

module DSL
class DomainSpecificLanguage

  attr_accessor :config, :test_data, :helper
  attr_accessor :automation, :web, :mobile_web, :mobile_app

  def initialize config = "./config.yaml"
    @config = YAML.load_file(config).to_ostruct
    @test_data = YAML.load_file(@config.test_data).to_ostruct
    @helper = CogBurn::Helper.new @config
    case @config.app_type.to_s.downcase
    when "web"
      @web = DSL::Web::WebDsl.new self
      @automation = @web
    end
  end

  def quit
    @web.driver.quit if @web != nil
    @mobile_web.driver.quit if @mobile_web != nil
    @mobile_app.driver.quit if @mobile_app != nil
  end

end # class DomainSpecificLanguage
end # module DSL