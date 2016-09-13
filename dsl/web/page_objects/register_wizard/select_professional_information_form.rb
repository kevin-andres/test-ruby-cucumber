require './dsl/web/page_objects/base_page'
require './dsl/web/page_objects/register_wizard/enter_name_form'

module DSL
module Web
module PageObjects
class SelectProfessionalInformationForm < BasePage

  def initialize dsl
    super(dsl)
  end

  # page elements
  select_list :professional_category, :css => "select#ContentPlaceHolder1_form_ctl_professionalinfo1_ddlCategory"
  select_list :speciality, :css => "select#ContentPlaceHolder1_form_ctl_professionalinfo1_ddlSpecialty"
  select_list :place_of_work_or_study, :css => "select#ContentPlaceHolder1_form_ctl_professionalinfo1_ddlPlaceOfWork"
  button :continue, :css => "input#btnContinue"

  # page methods
  def submit profession, speciality, place
    self.professional_category = profession
    self.speciality = speciality
    self.place_of_work_or_study = place
    self.continue
    @dsl.web.register_wizard.enter_name_form = EnterNameForm.new @dsl
  end



end
end # module PageObject
end # module Web
end # module DSL