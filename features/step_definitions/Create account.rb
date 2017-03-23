Then(/^user press on create account button$/) do
  @browser.button(:name, "dwfrm_login_register").wait_until_present.click

  #Generate random pass/email
  o = [('a'..'z')].map { |i| i.to_a }.flatten
  @name1 = (0...5).map { o[rand(o.length)] }.join
  @name2 = (0...5).map { o[rand(o.length)] }.join
  @email = (0...5).map { o[rand(o.length)] }.join
  @pass = (0...10).map { o[rand(o.length)] }.join
  @pass1 = (0...10).map { o[rand(o.length)] }.join
end

When(/^user is on Create account page$/) do
  @browser.element(:xpath, "//div[@id='primary']/div/h1").text  == "My Account - Create Account".upcase
end

Then(/^user fills the First name with correct data$/) do


  #Fill the first name
  @browser.text_field(:id, "dwfrm_profile_customer_firstname").send_keys(@name1)
end

Then(/^user fills the Last name with correct data$/) do
  @browser.text_field(:id, "dwfrm_profile_customer_lastname").send_keys (@name2)
end

Then(/^user fills the Email with correct data$/) do
  @browser.text_field(:id, "dwfrm_profile_customer_email").send_keys (@email+'@'+'gmail.com')
end

Then(/^user fills the Password1 with valid data$/) do
  @browser.text_field(:id, "dwfrm_profile_login_password").send_keys (@pass)
end

Then(/^user fills the Password2 with valid data$/) do
  @browser.text_field(:id, "dwfrm_profile_login_passwordconfirm").send_keys (@pass)
end

And(/^press on 'Create account' button on create acc page$/) do
  @browser.button(:name, "dwfrm_profile_confirm").wait_until_present.click
end

When(/^user navigates to My account LP$/) do

  @browser.element(:class, "account-subtitle").text.include? 'Welcome,'+ " " + @name1 + " " + @name2
end

Then(/^press on Log Out$/) do
  @browser.element(:css, ".link>a").wait_until_present.click
end


And(/^Verify validation messaged for each fields should be$/) do
  @browser.element(:id, "dwfrm_profile_customer_firstname-error").text == "Please enter First Name"
  @browser.element(:id, "dwfrm_profile_customer_lastname-error").text == "Please enter Last Name"
  @browser.element(:id, "dwfrm_profile_customer_email-error").text == "Please enter Email"
  @browser.element(:id, "dwfrm_profile_login_password-error").text == "Please enter Password"
  @browser.element(:id, "dwfrm_profile_login_passwordconfirm-error").text == "Please enter Confirm Password"
end

Then(/^Type first name with incorrect values like: @\#\$%\^&$/) do
  @browser.text_field(:id, "dwfrm_profile_customer_firstname").clear
  @browser.text_field(:id, "dwfrm_profile_customer_firstname").send_keys("#$%^&")
end

Then(/^Type last name with incorrect values like: @\#\$%\^&$/) do
  @browser.text_field(:id, "dwfrm_profile_customer_lastname").clear
  @browser.text_field(:id, "dwfrm_profile_customer_lastname").send_keys ('!@#$%^')
end

And(/^Verify validation message for First name should be: First name must only contain letters, periods, dashes, underscores and plus sign\.$/) do
  @browser.element(:css, "div.form-caption.error-message").text == "First name must only contain letters, periods, dashes, underscores and plus sign."

end

And(/^Verify validation message for Last name should be: Last name must only contain letters, periods, dashes, underscores and plus sign\.$/) do
  @browser.element(:xpath, "//form[@id='RegistrationForm']/div/div[2]/div[2]").text == "Last name must only contain letters, periods, dashes, underscores and plus sign."
end


Then(/^User Fills  the First name with one symbol$/) do
  @browser.text_field(:id, "dwfrm_profile_customer_firstname").clear
  @browser.text_field(:id, "dwfrm_profile_customer_firstname").send_keys("A")
end

Then(/^User Fills  the Last name with two symbol$/) do
  @browser.text_field(:id, "dwfrm_profile_customer_lastname").clear
  @browser.text_field(:id, "dwfrm_profile_customer_lastname").send_keys ('B')
end

And(/^verify the validations for First name: Please your first name must be between "2\-25" characters\.$/) do
    @browser.element(:css, "div.form-caption.error-message").text == "Please your first name must be between 2-25 characters."
end

And(/^Verify the validations for Last name: Please your last name must be between "2\-25" characters\.$/) do
   @browser.element(:xpath, "//form[@id='RegistrationForm']/div/div[2]/div[2]").text == "Please your last name must be between 2-25 characters."
end


Then(/^User Fills the First name with 25 symbols$/) do
  @browser.text_field(:id, "dwfrm_profile_customer_firstname").clear
  @browser.text_field(:id, "dwfrm_profile_customer_firstname").send_keys("asdfghjklqwertyuiopzxcbnm")
end


Then(/^User Fills the Last name with 26 symbols$/) do
  @browser.text_field(:id, "dwfrm_profile_customer_lastname").clear
  @browser.text_field(:id, "dwfrm_profile_customer_lastname").send_keys ('asdfghjklqwertyuiopzxcbnma')
  @browser.element(:xpath, "//form[@id='RegistrationForm']/div/div[2]/div[2]").text == "Please your last name must be between 2-25 characters."
end

Then(/^entered incorrect email  like ogboiko@$/) do
  @browser.text_field(:id, "dwfrm_profile_customer_lastname").clear
  @browser.text_field(:id, "dwfrm_profile_customer_lastname").send_keys ('test')
  @browser.text_field(:id, "dwfrm_profile_customer_email").clear
  @browser.text_field(:id, "dwfrm_profile_customer_email").send_keys ("ogboiko@")
end

And(/^verify the validation message for  email filed: Please enter a valid email address$/) do
  @browser.element(:css, "div.form-caption.error-message").text == "Please enter a valid email address"
end


Then(/^user fills the Email that is registered in the system like: ogboiko@gmail\.com$/) do
  @browser.text_field(:id, "dwfrm_profile_customer_email").clear
  @browser.text_field(:id, "dwfrm_profile_customer_email").send_keys ("ogboiko@gmail.com")
end

Then(/^verify the validation message for Email:  An account already exists for this email address; please sign in$/) do
  @browser.element(:css, "div.form-caption.error-message").text == "An account already exists for this email address; please sign in"
end

Then(/^fill the password1 with incorrect data like: 123456$/) do
  @browser.text_field(:id, "dwfrm_profile_login_password").clear
  @browser.text_field(:id, "dwfrm_profile_login_password").send_keys ('123456')
end

And(/^verify the validation message: Please enter a password between 7-20 characters\.$/) do
  @browser.element(:css, "div.form-caption.error-message").text == "Please enter a password between 7-20 characters."
end

Then(/^fill the password2 with data like: 123456$/) do
  @browser.text_field(:id, "dwfrm_profile_login_passwordconfirm").clear
  @browser.text_field(:id, "dwfrm_profile_login_passwordconfirm").send_keys (12345)
end

Then(/^fill the password2 with data like: 25$/) do
  @browser.text_field(:id, "dwfrm_profile_login_password").clear
  @browser.text_field(:id, "dwfrm_profile_login_password").send_keys ('1234567')
  @browser.text_field(:id, "dwfrm_profile_login_passwordconfirm").clear
  @browser.text_field(:id, "dwfrm_profile_login_passwordconfirm").send_keys (123456789123456789123456)
end


And(/^verify the valdiaiton message for password 2: Please enter a password between 7-20 characters\.$/) do
  @browser.element(:css, "div.form-caption.error-message").text == "Please enter a password between 7-20 characters."
end

Then(/^fill the password1 with incorrect data like: 25$/) do
  @browser.text_field(:id, "dwfrm_profile_login_password").clear
  @browser.text_field(:id, "dwfrm_profile_login_password").send_keys ('12345678912345678912345676')
end


Then(/^fill password 1 with correct data like: 1234567$/) do
  @browser.text_field(:id, "dwfrm_profile_login_password").clear
  @browser.text_field(:id, "dwfrm_profile_login_password").send_keys ('1234567')
end


And(/^verify that password 2 has validaiton message: Passwords do not match\.$/) do
  @browser.text_field(:id, "dwfrm_profile_customer_email").clear
  @browser.text_field(:id, "dwfrm_profile_customer_email").send_keys (@email+'@'+'gmail.com')
  @browser.element(:css, "div.form-caption.error-message").text == "Passwords do not match."
end

