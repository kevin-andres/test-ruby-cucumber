module DSL
module Web
module PageObjects
class BasePage
  include PageObject

  attr_accessor :dsl, :url, :title, :expected_elements, :timeout

  def initialize dsl
    super dsl.web.driver, dsl.config.implicit_wait_timeout
    @dsl = dsl
  end

  def visit
    if @url != nil
      dsl.web.driver.get dsl.test_data.url + @url
    end
  end

  def displayed?
    response = true
    @expected_elements.each do |element|
      if response then response = self.send("#{element}_element").visible? end
    end
    response
  end

end
end # module PageObject
end # module Web
end # module DSL