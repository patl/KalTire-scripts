require 'selenium-webdriver'
require 'cucumber'
require 'rspec'
require 'watir'






Given(/^open the site$/) do
  @browser = Watir::Browser.new :chrome
  @browser.window.maximize
  #browser.goto 'https://storefront:kt2017@development-store-kaltire.demandware.net/s/Kaltire/home'
  @browser.goto 'https://staging-store-kaltire.demandware.net/s/Kaltire/home'
  begin
    alert = @browser.alert.exists?
    if alert == true
      @browser.alert.ok
    else
      p 'no alert'
    end
  end

  year = [('1980'..'2017')].map { |i| i.to_a }.flatten
  @year = (0..0).map { year[rand(year.length)] }.join

  make_column = [('1'..'5')].map { |i| i.to_a }.flatten
  @make_column = (0..0).map { make_column[rand(make_column.length)] }.join

  make_row = [('1'..'7')].map { |i| i.to_a }.flatten
  @make_row = (0..0).map { make_row[rand(make_row.length)] }.join

  tire_width_column = [('1'..'2')].map { |i| i.to_a }.flatten
  @tire_width_column = (0..0).map { tire_width_column[rand(tire_width_column.length)] }.join

  tire_width_row = [('1'..'9')].map { |i| i.to_a }.flatten
  @tire_width_row = (0..0).map { tire_width_row[rand(tire_width_row.length)] }.join

  #Generate random pass/email
  o = [('a'..'z')].map { |i| i.to_a }.flatten
  @name1 = (0...5).map { o[rand(o.length)] }.join
  @name2 = (0...5).map { o[rand(o.length)] }.join
  @email = (0...5).map { o[rand(o.length)] }.join
  @pass = (0...10).map { o[rand(o.length)] }.join
  @pass1 = (0...10).map { o[rand(o.length)] }.join
end

When(/^user press on 'Log in' from header$/) do
  @browser.link(:text, "Sign in").wait_until_present.click
end

Then(/^he navigates to 'Log in'page$/) do
  @browser.element(:class, "login-page-title").text =="MY ACCOUNT - LOG IN"
end


And(/^close the browser$/) do
  @browser.close
end