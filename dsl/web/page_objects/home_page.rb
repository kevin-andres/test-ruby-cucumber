require './dsl/web/page_objects/base_page'
require './dsl/web/page_objects/common_sections/header'
require './dsl/web/page_objects/common_sections/footer'

module DSL
module Web
module PageObjects
class HomePage < BasePage

  attr_accessor :header, :footer

  def initialize dsl
    super(dsl)
    @url = "/"
    @header = Header.new dsl
    @footer = Footer.new dsl
  end

  expected_title "The New England Journal of Medicine: Research & Review Articles on Disease & Clinical Practice"

  # page elements

  # page methods


end
end # module PageObject
end # module Web
end # module DSL