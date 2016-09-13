require './dsl/web/page_objects/base_page'
require './dsl/web/page_objects/register_wizard/email_updates_form'

module DSL
module Web
module PageObjects
class EnterNameForm < BasePage

  def initialize dsl
    super(dsl)
  end

  # page elements
  text_field :first_name, :css => "input#ContentPlaceHolder1_form_txtFirstName"
  text_field :last_name, :css => "input#ContentPlaceHolder1_form_txtLastName"
  button :continue, :css => "input#btnContinue"

  # page methods
  def submit fname, lname
    self.first_name = fname
    self.last_name = lname
    self.continue
    @dsl.web.register_wizard.email_updates_form = EmailUpdatesForm.new @dsl
  end

end
end # module PageObject
end # module Web
end # module DSL