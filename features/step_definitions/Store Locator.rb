Then(/^user navigates to Location page from menu$/) do
  @browser.element(:xpath, "//ul[@id='mainNav']/li[4]/a/span").click
end

And(/^Verify that user is on Store locator page$/) do
  @browser.element(:css, "h1.page-title").text == "FIND A LOCATION"
end

And(/^User fills the search field on store locator page with Alberta$/) do
  @browser.element(:id, "start_location").send_keys "Alberta, Canada"
 end

Then(/^Press on Search button for search$/) do
  @browser.element(:css, 'button.button.small').click
end

And(/^verify that Alberta stores are displayed$/) do
  @browser.element(:css, "div.location-item").text == "Kal Tire - #610 EDSON STORE\n5959 3RD AVENUE\nEDSON, AB T7E 1R8\n(780) 712-7540\nDistance: 65km"
end

Then(/^press on Alberta store and from the list$/) do
  @browser.element(:xpath, "//div[@id='iam-sl-list-view-items']/div/div/div[2]/p[3]").wait_until_present.click
 end

And(/^verify that pop\-up is displayed on the map$/) do
  @browser.element(:class, "map-infobox").wait_until_present
end

Then(/^User press on Detail button from the pop\-up$/) do
  @browser.element(:xpath, ".//*[@id='iam-sl-map-canvas']/div/div/div[1]/div[4]/div[4]/div/div/div/p[2]/a").wait_until_present.click
  end

And(/^verify that Location detail page is displayed$/) do
  @browser.element(:css, "h1.page-title").text == "Location Details".upcase
end


Then(/^press on Back to store page$/) do
  @browser.element(:xpath, "//div[@id='main']/div/div/div/div/div/a[2]").click
end

Then(/^User press on List of all Locations$/) do
  @browser.element(:xpath, "//div[@id='main']/div/div/div/div/a").click
end

And(/^verify that user is on All location page$/) do
  @browser.element(:css, "h1.page-title").text == 'KAL TIRE - ALL LOCATIONS'
end

And(/^verify that Alberta is expended$/) do
  @browser.element(:css, "h3.city-name").text == "Acheson"
end

And(/^navigate back to Location page$/) do
  @browser.element(:xpath, "//div[@id='main']/div/div/div/div/a[2]").click
end