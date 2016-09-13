# Base Page Object

module CogBurn
module PageObjects
module Web
  class BasePage
    include PageObject

    def visit
      goto
    end
  end # class BasePage
end
end
end # module CogBurn::PageObjects::Web
