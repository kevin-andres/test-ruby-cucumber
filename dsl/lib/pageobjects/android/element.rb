module CogBurn::PageObjects::Android
  class Element
    attr_accessor :driver, :query, :timeout

    def initialize driver, query, timeout = 10
      @driver = driver
      @query = query
      @timeout = timeout
    end

    def present?
      @driver.element_exists @query
    end

    def tap
      @driver.touch @query
    end

    def text= text
      @driver.query @query, setText: text
    end

    def text
      (@driver.query @query, "text").first.to_s
    end

    def send_keys text
      @driver.query @query, setText: text
    end

    def wait_for_exist timeout = @timeout
      @driver.wait_for_elements_exist [@query], :timeout=>timeout
    end

    def wait_for_text text, timeout = @timeout
      self.wait_for_exist timeout
      if self.present?
        timeout.times do
          break if self.text.include? text
          sleep 1
        end
      end
    end

  end # class Element
end # module CogBurn::PageObjects::Android