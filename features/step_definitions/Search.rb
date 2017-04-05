Then(/^user presses on Search icon from header$/) do
  sleep (2)
    @browser.element(:xpath, ".//*[@id='mainMenuWrapper']/div[2]/ul[2]/li[1]/a/i").click
end

When(/^user types the Wheels in search field$/) do
  sleep(2)
  @searched_word = 'Wheels'
  @browser.element(:xpath, "//div[@id='mainMenuWrapper']/div[2]/ul[2]/li/div/form/fieldset/input").send_keys (@searched_word)
end

Then(/^verify that search pop-up is displayed$/) do
  sleep(1)
  @browser.element(:xpath, ".//*[@id='mainMenuWrapper']/div[2]/ul[2]/li[1]/div/div").visible?
end

Then(/^verify that Products section is displayed$/) do
  @browser.element(:xpath, ".//*[@id='mainMenuWrapper']/div[2]/ul[2]/li[1]/div/div/div[1]/h5").text == "PRODUCTS"
end

Then(/^verify that Other Popular section is displayed$/) do
  @browser.element(:xpath, ".//*[@id='mainMenuWrapper']/div[2]/ul[2]/li[1]/div/div/div[2]/div/h5").text == "Other Popular Searches"
end

When(/^user types the Tires in search field$/) do
  @browser.element(:xpath, "//div[@id='mainMenuWrapper']/div[2]/ul[2]/li/div/form/fieldset/input").to_subtype.clear
  @browser.element(:xpath, "//div[@id='mainMenuWrapper']/div[2]/ul[2]/li/div/form/fieldset/input").send_keys "Tires"
end

When(/^user types the Product Name like x-ice in search field$/) do
  @browser.element(:xpath, "//div[@id='mainMenuWrapper']/div[2]/ul[2]/li/div/form/fieldset/input").to_subtype.clear
  @browser.element(:xpath, "//div[@id='mainMenuWrapper']/div[2]/ul[2]/li/div/form/fieldset/input").send_keys "x-ice"
end

And(/^verify that product x\-ice is exists in each products name$/) do
  @browser.element(:xpath, "html/body/div[1]/div[3]/div/div/div[2]/div[2]/ul[2]/li[1]/div/div/div[1]//a/div[2]/div[2]").text.include? "x-ice".upcase
end


And(/^Verify that Wheels is include in Other popular search$/) do

 begin
  wheels =  @browser.element(:xpath, ".//a[@class='hit'][contains(text(), 'Wheel')]").exists?
if wheels == true
    p'Wheels are present'
else
    p'test failed'
end
 rescue Selenium::WebDriver::Error::NoSuchElementError
 end
end


And(/^Verify that Tires is include in Other popular search$/) do
  begin
    tires =  @browser.element(:xpath, "//a[@class='hit'][contains(text(), 'Tires')]").exists?
    if tires == true
      p'Tires are present'
    else
       p'test failed'
    end
  rescue Selenium::WebDriver::Error::NoSuchElementError
  end
end


Then(/^press on Enter\/Search$/) do
  @browser.element(:xpath, "//div[@id='mainMenuWrapper']/div[2]/ul[2]/li/div/form/fieldset/input").send_keys :enter
end

And(/^verify that Search result page is displayed$/) do
  sleep(2)
  @browser.element(:css, "span.page-title").text == "Search Results".upcase
  end

And(/^verify that results on the page are for search word$/) do
  @browser.element(:css, "div.search-info").text.include? "Results Found For" + ' '+'"' + (@searched_word) +'"'
end

Then(/^verify that Filter result is displayed$/) do
  @browser.element(:css, "h2.refinement-title.show-for-large").text == "Filter Results"
end

And(/^press on Brand filter from Filter result section for wheels$/) do
  @browser.element(:link_text, "Brand").click

end

And(/^select the option for brand wheel$/) do
  sleep(2)
   @browser.element(:xpath, ".//*[@class='scrollable menu vertical nested submenu is-accordion-submenu is-active']//li["+(@brand_option_w)+"]/a").click
<<<<<<< HEAD
   @brand = @browser.element(:xpath, ".//*[@class='scrollable menu vertical nested submenu is-accordion-submenu is-active']//li["+(@brand_option_w)+"]/a").text

  end

Then(/^verify that only products with selected option brand is displayed on the grid$/) do
<<<<<<< HEAD
  sleep(2)
=======
   @brand = @browser.element(:xpath, ".//*[@class='selected is-submenu-item is-accordion-submenu-item']").text

  end

Then(/^verify that only products with selected option brand is displayed on the grid$/) do
sleep(2)
>>>>>>> origin/master
=======
>>>>>>> parent of 1a6cf78... from office
  @browser.element(:xpath, "//a[@class='name-link brand-name'][contains(text(), '"+(@brand)+"')]").visible?
end

And(/^uncheck selected option for brand$/) do
  @browser.element(:xpath, ".//*[@class='is-active  scrollable menu vertical nested submenu is-accordion-submenu active-submenu']/li["+(@brand_option_w)+"]/a").click
  sleep(2)
end

And(/^press on Diameter filter from Filter result section for wheels$/) do
  @browser.element(:link_text, "Diameter").click

end

And(/^select the option for diameter wheel$/) do
  sleep(2)
  @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div/div[2]/div/div/div[2]/div[1]/div/div/div[5]/ul/li/ul/li["+(@diameter)+"]/a").click
  @diameter_selected = @browser.element(:xpath, ".//*[@class='selected is-submenu-item is-accordion-submenu-item']").text

end

Then(/^verify that products has selected diameter option on the grid$/) do
<<<<<<< HEAD
<<<<<<< HEAD
  @browser.element(:class, "product-attributes").text.include? @diameter
=======
    @browser.element(:xpath, "//*[@class='product-attributes'][contains(text(), '"+(@diameter_selected)+"')]").visible?
>>>>>>> origin/master
=======
  @browser.element(:class, "product-attributes").include? @diameter
>>>>>>> parent of 1a6cf78... from office
end

And(/^uncheck selected option diameter$/) do
  @browser.element(:css, "a[title=\"Refine by:"+(@diameter)+"\"] > i.icon-circle-thin").click
end