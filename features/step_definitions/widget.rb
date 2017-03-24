Then(/^User presses on Shop Tires By Vehicle tab$/) do
  @browser.element(:css, "div.selector-tab").when_present.click
end

Then(/^select Year for tires by vehicle$/) do
  sleep (2)
  @browser.element(:xpath, "(//a[contains(text(),"+(@year)+")])[2]").click
end

Then(/^select Make for tires by vehicle$/) do
  sleep (2)
  @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[3]/div[4]/div[2]/div/ul/li/div/ul["+(@make_column)+"]/li[" +(@make_row)+"]/a").click
  sleep(2)
  selected_make = @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[3]/div[1]/div[2]/a").text
  @selected_make =selected_make
end

Then(/^select Model for tires by vehicle$/) do
  sleep (2)
  begin
    model = @browser.element(:link_text, "Model").visible?
    if model == true
      @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[3]/div[4]/div[3]/div/ul/li/div/ul[1]/li[1]/a").click
    else
      puts 'nothing select'
    end
  rescue Selenium::WebDriver::Error::NoSuchElementError

  end
  selected_model = @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[3]/div[1]/div[3]/a").text
  @selected_model =  selected_model
  selected_option = @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[3]/div[1]/div[5]/a").text
  @selected_option = selected_option
end

Then(/^select Options for tires by vehicle$/) do
  sleep (2)
  begin
    option = @browser.element(:link_text, "Option").present?
    if option == true
      sleep (1)
      @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[3]/div[4]/div[5]/div/ul/li/div/ul/li/a").click
      selected_option = @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[3]/div[1]/div[5]/a").text
      @selected_option = selected_option
    else
      puts 'nothing select'
    end
  rescue Selenium::WebDriver::Error::NoSuchElementError
  end
end

Then(/^select Size for tires by vehicle$/) do
  sleep (2)
  begin
    size = @browser.element(:link_text, "Size").present?
    if size == true
      sleep (1)
      @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[3]/div[4]/div[6]/div/ul/li[1]/a")
    else
      puts 'nothing select'
    end
  rescue Selenium::WebDriver::Error::NoSuchElementError
  end
end

When(/^verify that searched page is displayed$/) do
  sleep(3)
  @browser.element(:css, ".psresults-title").text == "SELECT TIRE CATEGORY"
end

And(/^verify searching car by Year and Make$/) do
  p @year
  p @selected_make
  p @selected_model
  p @selected_option
  @browser.element(:css, ".sel-title").text.include? @year + " " + @selected_make + " " + @selected_model+ " " + @selected_option
end



#Tires
Then(/^User presses to Shop Tires By Size$/) do
  @browser.element(:xpath, 'html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[2]/div[2]').when_present.click
end

And(/^check "How yo find you tires" pop-up$/) do
  @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[6]/div[5]/a").click
  @browser.button(:class,"close-button").click
end

Then(/^select Tires width for tires by size$/) do
  @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[6]/div[4]/div[1]/div/ul/li/div/ul["+(@tire_width_column)+"]/li["+(@tire_width_row)+"]/a").click
  @tires_width = @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[6]/div[2]/div[1]/a").text
end

Then(/^select Tires profile  for tires by size$/) do
  @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[6]/div[4]/div[2]/div/ul/li/div/ul[1]/li["+(@tire_width_column)+"]/a").click
  @tires_profile = @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[6]/div[2]/div[2]/a").text
end

Then(/^select Diameter  for tires by size$/) do
  sleep(2)
  begin
    diameter = @browser.element(:link_text, "Diameter").visible?
    if diameter == true
      sleep(1)
      @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[6]/div[4]/div[3]/div/ul/li/div/ul/li[1]/a").click
    else
      puts 'nothing select'
    end
  rescue Selenium::WebDriver::Error::NoSuchElementError
  end
end

And(/^Verify searching Tires by Width$/) do
  @browser.element(:css, ".sel-subtitle").text.include? @tires_width + "/" + @tires_profile
end

#wheels by vehicle


Then(/^user presses on Wheels tab on widget$/) do
  @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/div/div/div[2]").click
end

Then(/^user presses on Shop Wheels By Vehicle$/) do
  @browser.element(:xpath, 'html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[2]/ul/li/div/div[2]/div[1]').click
end

Then(/^select Year for wheels by vehicle$/) do
  @browser.element(:xpath, "(//a[contains(text(),"+(@year)+")])[4]").click
end

Then(/^select Make for wheels by vehicle$/) do
  sleep(2)
  @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[2]/ul/li/div/div[3]/div[4]/div[2]/div/ul/li[1]/div/ul["+(@make_column)+"]/li[" +(@make_row)+"]/a").click
  sleep(1)
  selected_make = @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[2]/ul/li/div/div[3]/div[1]/div[2]/a").text
  @selected_make =selected_make
end

Then(/^select Model for wheels by vehicle$/) do
  sleep (2)
  begin
    model = @browser.element(:xpath, "(//a[contains(text(),'Model')])[3]").visible?
    if model == true
      sleep(1)
      @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[2]/ul/li/div/div[3]/div[4]/div[3]/div/ul/li/div/ul[1]/li[1]/a").click
    else
      puts 'nothing select'
    end
  rescue Selenium::WebDriver::Error::NoSuchElementError

  end

  selected_model = @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[2]/ul/li/div/div[3]/div[1]/div[3]/a").text
  @selected_model =  selected_model
  selected_option = @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[2]/ul/li/div/div[3]/div[1]/div[5]/a").text
  @selected_option = selected_option
end

Then(/^select Option for wheels by vehicle$/) do
  sleep (1)
  begin
    option = @browser.element(:xpath, "(//a[contains(text(),'Option')])[2]").present?
    if option == true
      sleep (2)
      @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[2]/ul/li/div/div[3]/div[4]/div[5]/div/ul/li/div/ul/li[1]/a").click
      selected_option = @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[2]/ul/li/div/div[3]/div[4]/div[5]/div/ul/li/div/ul/li[1]/a").text
      @selected_option = selected_option
    else
      puts 'nothing select'
    end
  rescue Selenium::WebDriver::Error::NoSuchElementError
  end
end

Then(/^select Size for wheels by vehicle$/) do
  sleep (2)
  begin
    size = @browser.element(:xpath, "(//a[contains(text(),'Size')])[6]").present?
    if size == true
      sleep (2)
      homologated = @browser.element(:class, "oemarkingModalCta").present?
      if homologated ==true
        @browser.element(:xpath, 'html/body/div[2]/div/div/a[2]').click
      else
        puts 'There is no homologated pop-up'
      end
      @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[2]/ul/li/div/div[3]/div[4]/div[6]/div/ul/li[1]/a").click
    else
      puts 'nothing select'
    end
  rescue Selenium::WebDriver::Error::NoSuchElementError
  end
end

And(/^verify that CLP is open$/) do
  @browser.element(:class, 'page-title').text =='SHOP WHEELS' || "SEARCH RESULTS" || "SHOP TIRES"
end

And(/^verify searching car by Year and Make for wheels$/) do
  begin
    if @browser.element(:class, 'page-title').text =='SHOP WHEELS'
    then @browser.element(:css, ".sel-title").text.include? @year + " " + @selected_make + " " + @selected_model+ " " + @selected_option
    else
      p 'you are on no result page'
    end
  rescue Selenium::WebDriver::Error::NoSuchElementError
  end
end
#wheels by size
Then(/^user press on Shop Wheels by size tab$/) do
  @browser.element(:xpath, "//li[2]/ul/li/div/div[2]/div[2]").click
end

Then(/^select Bolt Pattern$/) do
  @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[2]/ul/li/div/div[6]/div[4]/div[1]/div/ul/li/div/ul["+(@bolt_pattern_c)+"]/li["+(@bolt_pattern_r)+"]/a").click
  selected_bolt_pattern = @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[2]/ul/li/div/div[6]/div[2]/div[1]/a").text
  @selected_bolt_pattern =  selected_bolt_pattern
end


Then(/^select Wheel Diameter$/) do
  begin
    diameter = @browser.element(:link_text, "Wheel Diameter").present?
   if diameter == true
    sleep (2)
    @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[2]/ul/li/div/div[6]/div[4]/div[2]/div/ul/li/div/ul/li[3]/a").click
    wheels_diameter = @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[2]/ul/li/div/div[6]/div[2]/div[2]/a").text
    @wheels_diameter = wheels_diameter
  else
    puts 'nothing select'
  end
  rescue Selenium::WebDriver::Error::NoSuchElementError
end


end

And(/^verify searching Wheels size$/) do
  begin
    if @browser.element(:class, 'page-title').text =='SHOP WHEELS'
    then @browser.element(:css, ".sel-title").text.include? @wheels_diameter
    else
      p 'you are on no result page'
    end
  rescue Selenium::WebDriver::Error::NoSuchElementError
  end
end

#Selling path
Then(/^user selects the Year for tires by vehicle 2015$/) do
  sleep(2)
  @browser.element(:xpath, "(//a[contains(text(),2015)])[2]").click
end

Then(/^user selects Make for tires by vehicle Subaru$/) do
  sleep(2)
  @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[3]/div[4]/div[2]/div/ul/li/div/ul[5]/li[4]/a").click
end

Then(/^user selects Model for tires by vehicle Forester$/) do
  sleep(2)
  @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[3]/div[4]/div[3]/div/ul/li/div/ul/li[2]/a").click
end

Then(/^user selects Option for tires by vehicle 2.0XT$/) do 
  sleep(2)
  @browser.element(:xpath, "html/body/div[1]/div[4]/div[2]/div[2]/div/div/div[2]/div/ul/li[1]/ul/li/div/div[3]/div[4]/div[5]/div/ul/li/div/ul/li/a").click
end


Then(/^press on Get Started button$/) do
  @browser.element(:id, "gspStartCTA").click
 end

And(/^verify that question 1 is displayed: Which road conditions will you be driving on with these tires$/) do
  @browser.element(:xpath, "//div[@id='guidedSellingPathWrapper']/div/div/div").text == "1\nWhich road conditions will you be driving on with these tires?"
end

Then(/^user selects Dry pavement$/) do
  @browser.element(:xpath, "//div[@id='guidedSellingPathWrapper']/div/div[2]/div/ul/li").click

end

Then(/^user selects Rain$/) do
  @browser.element(:xpath, "//div[@id='guidedSellingPathWrapper']/div/div[2]/div/ul/li[2]").click

end

Then(/^user selects Ice\/Snow\/Slush$/) do
  @browser.element(:xpath, "//div[@id='guidedSellingPathWrapper']/div/div[2]/div/ul/li[3]").click

end

Then(/^user selects Gravel$/) do
  @browser.element(:xpath, "//div[@id='guidedSellingPathWrapper']/div/div[2]/div/ul/li[4]").click

end

Then(/^user selects Heavy Mud$/) do
  @browser.element(:xpath, "//div[@id='guidedSellingPathWrapper']/div/div[2]/div/ul/li[5]").click
 end

And(/^preses on Next button for Qs$/) do
  sleep(2)
  @browser.element(:id, "gspNextAction").click
end

When(/^user is on Q2:  Do you currently put on different tires for the winter\?$/) do
  @browser.element(:css, "div.large-10.columns").text== "2\nDo you currently put on different tires for the winter?"

end

Then(/^select Yes I swap to winter\.\.\.$/) do
  @browser.element(:xpath, "//div[@id='guidedSellingPathWrapper']/div/div[2]/div/ul/li").click
end


And(/^verify that Winter tires are displayed Based in your responses, we recommend Winter tires$/) do
  @browser.element(:css, "h4").text == "Based in your responses, we recommend Winter tires."
end

And(/^verify that Winter tires are displayed in Grid$/) do
  @browser.element(:css, "div.category.cat-winter").text == "Winter"
end

Then(/^press on Change my responses$/) do
  @browser.element(:link_text, "< Change my Responses").click
end

Then(/^select No My vehicle has one$/) do
  @browser.element(:xpath, "//div[@id='guidedSellingPathWrapper']/div/div[2]/div/ul/li[2]").click
end

Then(/^Verify that Q3 is displayed  In Canada, we recommend changing your tires for the winter to provide superior driving performance in winter road conditions$/) do
  @browser.element(:css, "div.large-10.columns").text == "3\nIn Canada, we recommend changing your tires for the winter to provide superior driving performance in winter road conditions."
end

When(/^user selects Show me winter tire$/) do
  @browser.element(:xpath, "//div[@id='guidedSellingPathWrapper']/div/div[2]/div/ul/li/p").click
end

When(/^user selects Show me Alternatives$/) do
  @browser.element(:xpath, "//div[@id='guidedSellingPathWrapper']/div/div[2]/div/ul/li[2]/img").click
end

And(/^verify that All Weather tires are displayed Based in your responses, we recommend All Weather tires\.$/) do
  @browser.element(:xpath, "//div[@id='results-info-from-gsp']/div/div/h4").text == "Based in your responses, we recommend All Weather tires."
end

And(/^verify that All Weather tires are displayed in Grid$/) do
  @browser.element(:css, ".category.cat-all-weather").text == "All-weather"
end