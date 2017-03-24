Feature: Tires By Vehicle

  Background:
    Given open the site

  Scenario: Choose any Tires By Vehicle
      Then User presses on Shop Tires By Vehicle tab
      Then select Year for tires by vehicle
      Then select Make for tires by vehicle
      Then select Model for tires by vehicle
      Then select Options for tires by vehicle
      Then select Size for tires by vehicle
      When verify that searched page is displayed
      And verify searching car by Year and Make
      And close the browser


  Scenario: Check Tires by size functionality
      Then User presses to Shop Tires By Size
      And check "How yo find you tires" pop-up
      Then select Tires width for tires by size
      Then select Tires profile  for tires by size
      Then select Diameter  for tires by size
      Then verify that searched page is displayed
      And Verify searching Tires by Width
      And close the browser






