require './dsl/web/page_objects/base_page'
require './dsl/web/page_objects/common_sections/header'
require './dsl/web/page_objects/register_wizard/create_account_form'
require './dsl/web/page_objects/register_wizard/select_location_form'
require './dsl/web/page_objects/register_wizard/select_professional_information_form'
require './dsl/web/page_objects/register_wizard/enter_name_form'
module DSL
module Web
module PageObjects
class RegisterWizard < BasePage

  attr_accessor :header,
      :create_account_form,
      :select_location_form,
      :select_professional_information_form,
      :enter_name_form,
      :email_updates_form

  def initialize dsl
    super(dsl)
    @url = "/"
    @header = Header.new dsl
    @create_account_form = CreateAccountForm.new dsl
  end

  # page elements
  div :progress_bar, :css=>"div#progressBar"
  images :progress_block, :css=>".blocks"

  # page methods
  def progress_status
    state = 0
    progress_block_elements.each do |element|
      if element.attribute("src").include? "Blue"
        state += 1
      end
    end
    "#{state}/5"
  end

end
end # module PageObject
end # module Web
end # module DSL