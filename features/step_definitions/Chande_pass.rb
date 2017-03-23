Then(/^press on account setting from my account page$/) do
  @browser.element(:xpath, "html/body/div[1]/div[4]/div[1]/div/div/div/div[1]/div/nav/div/div[2]/ul/li[2]/a").wait_until_present.click
end

And(/^press on Edit for password$/) do
  @browser.link(:text, "(Edit)").wait_until_present.click
end

And(/^fill the Current Password fled with password$/) do
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div/div/input").clear
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div/div/input").send_keys (@pass)
end

And(/^fill the New Password fled with new password$/) do
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div[2]/div/input").clear
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div[2]/div/input").send_keys (@pass1)
end

And(/^fill the Repeat New Password fled with new password$/) do
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div[3]/div/input").clear
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div[3]/div/input").send_keys (@pass1)
end

And(/^Save changes$/) do
  @browser.button(:name, "dwfrm_profile_changepassword").wait_until_present.click
end

And(/^Log in with new password$/) do
  @browser.text_field(:id, "dwfrm_login_username").send_keys (@email+'@'+'gmail.com')
  @browser.text_field(:id, "dwfrm_login_password").send_keys (@pass1)
end


Then(/^verify validation message for Current Password$/) do
  @browser.element(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div/div/span").text == "Please enter Current Password"
end

Then(/^verify validation message for New Password$/) do
  @browser.element(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div[2]/div/span").text == "Please enter New Password"
end

Then(/^verify validation message for Repeat New Password$/) do
  @browser.element(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div[3]/div/span").text  == "Please enter Repeat New Password"
end


Then(/^fill the Current password with <7$/) do
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div/div/input").clear
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div/div/input").send_keys ("123456")
end

And(/^fill the New Password <7$/) do
  @browser.text_field(:xpath, "//div[3]/div/input").clear
  @browser.text_field(:xpath, "//div[3]/div/input").send_keys ("132456")
end

And(/^fill the Repeat Password <7$/) do
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div[2]/div/input").clear
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div[2]/div/input").send_keys ("132456")
end

Then(/^verify validation message for Current password Please enter a password between 7-20 characters.$/) do
  @browser.element(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div/div/span").text == "Please enter a password between 7-20 characters."
   end

Then(/^verify validation message for New password Please enter a password between 7-20 characters.$/) do
  @browser.element(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div[2]/div/span").text == "Please enter a password between 7-20 characters."
end

Then(/^verify validation message for Repeat password Please enter a password between 7-20 characters.$/) do
  @browser.element(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div[3]/div/span").text == "Please enter a password between 7-20 characters."
end


Then(/^fill the Current password with >20$/) do
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div/div/input").clear
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div/div/input").send_keys ("123456789123456789123")
end

And(/^fill the New Password >20$/) do
  @browser.text_field(:xpath, "//div[3]/div/input").clear
  @browser.text_field(:xpath, "//div[3]/div/input").send_keys ("123456789123456789123")
end

And(/^fill the Repeat Password >20$/) do
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div[2]/div/input").clear
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div[2]/div/input").send_keys ("123456789123456789123")
end

Then(/^the Current password with any valid data$/) do
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div/div/input").clear
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div/div/input").send_keys ("12345678")
 end

Then(/^verify the validation message for Current password Does not match the current password$/) do
  @browser.element(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div/div[2]").text == "Does not match the current password"
end

And(/^fill the repeat password with valid data != New password field$/) do
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div[3]/div/input").clear
  @browser.text_field(:xpath, "//form[@id='ChangePassowrdForm']/fieldset/div[3]/div/input").send_keys ("12345678")
end

And(/^verify validation message for Repeat new password Passwords do not match\.$/) do
  @browser.element(:css, "div.form-caption.error-message").text == "Passwords do not match."
end