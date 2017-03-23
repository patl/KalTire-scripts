And(/^user fills password on login page$/) do

  @browser.text_field(:id, "dwfrm_login_password").clear
  @browser.text_field(:id, "dwfrm_login_password").send_keys "ogboiko@gmail.com"
end

And(/^user fills the Email on login page$/) do
  @browser.text_field(:id, "dwfrm_login_username").clear
  @browser.text_field(:id, "dwfrm_login_username").send_keys "ogboiko@gmail.com"
end

And(/^he press on Log In button from Log In page$/) do
 @browser.element(:name, "dwfrm_login_login").click
end

Then(/^user navigates to My account LP verify greeting$/) do
  @browser.element(:class, "account-subtitle").text.include? 'Welcome,'+ " "
end


And(/^verify the validation messages for Log in$/) do
  @browser.element(:id, "dwfrm_login_username-error").text == "Please enter Email Address"
end

And(/^verify the validation message for Password$/) do
  @browser.element(:id, "dwfrm_login_password-error").text == "Please enter Password"
end

Then(/^Entered incorrect password <7$/) do
  @browser.text_field(:id, "dwfrm_login_password").send_keys "123456"
  
end

When(/^validation message is displayed Please enter a password between 7-20 characters.$/) do
  @browser.element(:id, "dwfrm_login_password-error").text == "Please enter a password between 7-20 characters."
end

Then(/^entered incorrect password >20$/) do
  @browser.text_field(:id, "dwfrm_login_password").clear
  @browser.text_field(:id, "dwfrm_login_password").send_keys "12345678912345678912345678"
end

And(/^fills the email on Login page with incorrect email ogboiko@$/) do
  @browser.text_field(:id, "dwfrm_login_username").clear
  @browser.text_field(:id, "dwfrm_login_username").send_keys "ogboiko@"
end

And(/^verify error message  Please enter a valid email address$/) do
  @browser.element(:css, "div.form-caption.error-message").text == "Please enter a valid email address."
end

Then(/^fills the email on login page with non existing email in the system$/) do
  @browser.text_field(:id, "dwfrm_login_username").clear
  @browser.text_field(:id, "dwfrm_login_username").send_keys "hsdgkahsgdka@asdasd.asd"
end

And(/^verify the error message Sorry, this does not match our records\. Check your spelling and try again\.$/) do
  @browser.element(:css, "div.error-form").text == "Sorry, this does not match our records. Check your spelling and try again."
end