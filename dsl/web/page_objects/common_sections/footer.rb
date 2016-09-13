require './dsl/web/page_objects/base_page'
require './dsl/web/page_objects/register_wizard/register_wizard'
require './dsl/web/page_objects/register_page'
require './dsl/web/page_objects/your_nejm_account_page'

module DSL
module Web
module PageObjects
class Footer < BasePage
  def initialize dsl
    super(dsl)

    @expected_elements = [
        :create_or_manage_account
      ]
  end

  expected_element :create_or_manage_account

  # page elements
  link :create_or_manage_account, :link_text => "Create or Manage Account"

  # page methods
  def select_create_account
    self.create_or_manage_account
    @dsl.web.your_nejm_account_page = YourNejmAccountPage.new @dsl
    @dsl.web.your_nejm_account_page
  end

end
end # module PageObject
end # module Web
end # module DSL