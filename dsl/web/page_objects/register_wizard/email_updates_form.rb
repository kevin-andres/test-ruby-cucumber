require './dsl/web/page_objects/base_page'
require './dsl/web/page_objects/your_nejm_account_page'

module DSL
module Web
module PageObjects
class EmailUpdatesForm < BasePage

  def initialize dsl
    super(dsl)
  end

  # page elements
  button :register, :css => "input#btnContinue"

  # page methods
  def submit
    self.register
    @dsl.web.your_nejm_account_page = YourNejmAccountPage.new @dsl
  end

end
end # module PageObject
end # module Web
end # module DSL