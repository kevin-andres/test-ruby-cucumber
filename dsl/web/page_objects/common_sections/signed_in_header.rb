require './dsl/web/page_objects/base_page'
require './dsl/web/page_objects/register_wizard/register_wizard'
require './dsl/web/page_objects/register_page'

module DSL
module Web
module PageObjects
class SignedInHeader < BasePage
  def initialize dsl
    super(dsl)

    @expected_elements = [
        :sign_out,
        :my_nejm_menu,
        :status_message
      ]
  end

  expected_element :create_account

  # page elements
  link :sign_out, :link_text => "Sign Out"
  link :my_nejm_menu, :link_text => "My NEJM"
  list_item :status_message, :css => "li.status"

  # page methods
  def select_create_account
    self.create_account
    if current_url.include? "register/reg_onestep"
      @dsl.web.register_page = RegisterPage.new @dsl
      return @dsl.web.register_page
    elsif current_url.include? "register/reg_multistep"
      @dsl.web.register_wizard = RegisterWizard.new @dsl
      return @dsl.web.register_wizard
    end
  end

end
end # module PageObject
end # module Web
end # module DSL