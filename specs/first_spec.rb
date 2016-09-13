require './dsl/domain_specific_language'

describe "First Spec" do
  context "is cool" do
    before :all do
      @app = DSL::DomainSpecificLanguage.new
      @data = @app.test_data.create_user
      @timestamp = @app.helper.timestamp
      @data.email = @app.helper.fill_timestamp @data.email, @timestamp
      @data.first_name = @app.helper.fill_timestamp @data.first_name, @timestamp
    end
    after :all do
      @app.quit
    end
    it "is executed" do
      @app.web.home_page.visit
      @app.web.home_page.footer.select_create_account
      @app.web.your_nejm_account_page.select_create_an_account
      @app.web.register_wizard.progress_status.should eq "1/5"
      @app.web.register_wizard.create_account_form.submit_valid_email_and_password @data.email, @data.password
      @app.web.register_wizard.select_location_form.select_country @data.country
      @app.web.register_wizard.select_professional_information_form.submit(
          @data.professional_category,
          @data.speciality,
          @data.place_of_work_or_study
        )
      @app.web.register_wizard.enter_name_form.submit @data.first_name, @data.last_name
      @app.web.register_wizard.email_updates_form.submit

#       @app.web.home_page.header.has_expected_element?.should be_true
#       @app.web.home_page.header.displayed?.should be_true
#       @app.web.home_page.header.has_expected_element?
#       @app.web.home_page.header.select_create_account
#       @app.web.register_wizard.progress_status
    end
  end
end