Given "NEJM homepage is open" do
  @app.automation.home_page.visit
end

Given "user is not signed in" do
  expect(@app.automation.home_page.header.status_message).to eql "Welcome Guest"
end

When "I create an account with following details" do |table|
  @data = (table.hashes[0]).to_ostruct
  @timestamp = @app.helper.timestamp
  @data.email = @app.helper.fill_timestamp @data.email, @timestamp
  @data.first_name = @app.helper.fill_timestamp @data.first_name, @timestamp
  @app.automation.home_page.footer.select_create_account
  @app.automation.your_nejm_account_page.select_create_an_account
  @app.automation.register_wizard.progress_status.should eq "1/5"
  @app.automation.register_wizard.create_account_form.submit_valid_email_and_password @data.email, @data.password
  @app.automation.register_wizard.select_location_form.select_country @data.country
  @app.automation.register_wizard.select_professional_information_form.submit(
      @data.professional_category,
      @data.speciality,
      @data.place_of_work_or_study
    )
  @app.automation.register_wizard.enter_name_form.submit @data.first_name, @data.last_name
  @app.automation.register_wizard.email_updates_form.submit

end

Then (/^(.*?) page is displayed$/) do |page|
  page = page.downcase.gsub(" ","_")
  expect(@app.automation.send("#{page}_page").displayed?).to be_true
end

Then "user is signed in" do
  expect(@app.automation.your_nejm_account_page.signed_in_header.status_message).to_not eql "Welcome Guest"
  expect(@app.automation.your_nejm_account_page.signed_in_header.status_message).to eql "Welcome #{@data.first_name} #{@data.last_name}"
  expect(@app.automation.your_nejm_account_page.signed_in_header.displayed?).to be_true
end
