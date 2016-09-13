require "./dsl/web/page_objects/home_page"

module DSL
module Web

class WebDsl

  attr_accessor :driver
  attr_accessor :home_page, :register_wizard, :register_page, :your_nejm_account_page

  def initialize dsl
    browser_sym = dsl.config.browser.downcase.to_sym
    if dsl.config.execution_mode.to_s.downcase == "local"
      @driver = Selenium::WebDriver.for(browser_sym)
    elsif dsl.config.execution_mode.to_s.downcase == "remote"
      @driver = Selenium::WebDriver.for(:remote, :url => dsl.config.server, :desired_capabilities => browser_sym)
    else
      raise "Config Error - Incorrect Browser Type of name"
    end
    @driver.manage.timeouts.implicit_wait = dsl.config.implicit_wait_timeout.to_i
    @driver.manage.window.maximize if dsl.config.browser_window_maximize
    dsl.web = self
    @home_page = DSL::Web::PageObjects::HomePage.new dsl
  end

end

end # module Web
end # module DSL