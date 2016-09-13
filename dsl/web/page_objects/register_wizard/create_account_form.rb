require './dsl/web/page_objects/base_page'
require './dsl/web/page_objects/register_wizard/select_location_form'

module DSL
module Web
module PageObjects
class CreateAccountForm < BasePage

  def initialize dsl
    super(dsl)
  end

  # page elements
  text_field :email, :css => "input#ContentPlaceHolder1_form_ctl_createaccount1_txtEmail"
  text_field :password, :css => "input#ContentPlaceHolder1_form_ctl_createaccount1_txtPassword"
  button :continue, :css => "input#btnContinue"

  # page methods
  def submit_valid_email_and_password(email,password)
    self.email = email
    self.password = password
    self.continue
    @dsl.web.register_wizard.select_location_form = SelectLocationForm.new @dsl
    @dsl.web.register_wizard.select_location_form
  end

end
end # module PageObject
end # module Web
end # module DSL