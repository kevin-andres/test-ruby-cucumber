require './dsl/web/page_objects/base_page'
require './dsl/web/page_objects/common_sections/header'
require './dsl/web/page_objects/common_sections/signed_in_header'
require './dsl/web/page_objects/common_sections/footer'
require './dsl/web/page_objects/register_wizard/register_wizard'

module DSL
module Web
module PageObjects
class YourNejmAccountPage < BasePage

  attr_accessor :header, :footer, :signed_in_header

  def initialize dsl
    super(dsl)
    @header = Header.new dsl
    @footer = Footer.new dsl
    @signed_in_header = SignedInHeader.new dsl

    @expected_elements = [ :page_title
      ]
  end

  expected_title "Your NEJM account"

  # page elements
  link(:create_an_account, :xpath => "//img[contains(@src,'create_account')]")
  h1 :page_title , :css=>"h1"

  # page methods
  def select_create_an_account
    self.create_an_account
    @dsl.web.register_wizard = RegisterWizard.new @dsl
    @dsl.web.register_wizard
  end

end
end # module PageObject
end # module Web
end # module DSL