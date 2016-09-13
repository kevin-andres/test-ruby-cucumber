# Base Page Object

require './lib/pageobjects/android/element'

module CogBurn
module PageObjects
module Android
  class BasePage

    attr_accessor :driver, :timeout

    def initialize driver, timeout=30
      @driver = driver
      @timeout = timeout
    end

    def send_enter_key
      @driver.performAction 'send_key_enter'
    end

    def wait_for_element_exist query, timeout = @timeout
      @driver.wait_for_elements_exist [query], :timeout=>timeout
    end
  end # class BasePage
end
end
end # module DSL::PageObjects::Web
