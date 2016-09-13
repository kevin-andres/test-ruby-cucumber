require 'selenium-webdriver'
require 'page-object'
require 'page-object/page_factory'

module CogBurn
module Drivers
  class WebDriver

    attr_accessor :driver

    def initialize config=({"execution_mode" => "local", "server" => nil, "browser" => "chrome", "implicit_wait_timeout" => 60, "browser_window_maximize" => false}).to_ostruct
      browser_sym = config.browser.downcase.to_sym
      if config.app_type.to_s.downcase == "local"
        @driver = Selenium::WebDriver.for(browser_sym)
      elsif config.web_app.type.to_s.downcase == "remote"
        @driver = Selenium::WebDriver.for(:remote, :url => config.web_app.server, :desired_capabilities => browser_sym)
      else
        raise "Config Error - Incorrect Browser Type"
      end
      @driver.manage.timeouts.implicit_wait = config.implicit_wait_timeout.to_i
      @driver.manage.window.maximize if config.browser_window_maximize
    end # def initialize...

  end # class WebDriver
end
end # module CogBurn::Drivers