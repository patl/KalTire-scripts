Then(/^user press on create account button$/) do
  @browser.button(:name, "dwfrm_login_register").wait_until_present.click
end

When(/^user is on Create account page$/) do
  @browser.element(:xpath, "//div[@id='primary']/div/h1").text  == "My Account - Create Account".upcase
end

Then(/^user feels the First name with correct data$/) do
  #Generate random pass/email
  o = [('a'..'z')].map { |i| i.to_a }.flatten
  @name1 = (0...5).map { o[rand(o.length)] }.join
  @name2 = (0...5).map { o[rand(o.length)] }.join
  @email = (0...5).map { o[rand(o.length)] }.join
  @pass = (0...10).map { o[rand(o.length)] }.join
  @pass1 = (0...10).map { o[rand(o.length)] }.join

  #Fill the first name
  @browser.text_field(:id, "dwfrm_profile_customer_firstname").send_keys(@name1)
end

Then(/^user feels the Last name with correct data$/) do
  @browser.text_field(:id, "dwfrm_profile_customer_lastname").send_keys (@name2)
end

Then(/^user feels the Email with correct data$/) do
  @browser.text_field(:id, "dwfrm_profile_customer_email").send_keys (@email+'@'+'gmail.com')
end

Then(/^user feels the Password1 with valid data$/) do |arg|
  @browser.text_field(:id, "dwfrm_profile_login_password").send_keys (@pass)
end

Then(/^user feels the Password2 with valid data$/) do |arg|
  @browser.text_field(:id, "dwfrm_profile_login_passwordconfirm").send_keys (@pass)
end

And(/^press on 'Create account' page$/) do
  @browser.button(:name, "dwfrm_profile_confirm").wait_until_present.click
end

When(/^user navigates to My account LP$/) do

  @browser.element(:class, "account-subtitle").text.include? 'Welcome,'+ " " + @name1 + " " + @name2
end

Then(/^press on Log Out$/) do
  @browser.element(:css, ".link>a").wait_until_present.click
end

