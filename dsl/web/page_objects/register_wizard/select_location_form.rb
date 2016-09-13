require './dsl/web/page_objects/base_page'
require './dsl/web/page_objects/register_wizard/select_professional_information_form'

module DSL
module Web
module PageObjects
class SelectLocationForm < BasePage

  def initialize dsl
    super(dsl)
  end

  # page elements
  select_list :country, :css => "select#ContentPlaceHolder1_form_ddlCountry"
  button :continue, :css => "input#btnContinue"

  # page methods
  def select_country country
    self.country = country
    self.continue
    @dsl.web.register_wizard.select_professional_information_form = SelectProfessionalInformationForm.new @dsl
    @dsl.web.register_wizard.select_professional_information_form
  end

end
end # module PageObject
end # module Web
end # module DSL