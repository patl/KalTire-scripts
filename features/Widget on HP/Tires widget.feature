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

  Scenario: Check the guided selling path
      Then User presses on Shop Tires By Vehicle tab
      Then user selects the Year for tires by vehicle 2015
      Then user selects Make for tires by vehicle Subaru
      Then user selects Model for tires by vehicle Forester
      Then user selects Option for tires by vehicle 2.0XT
      When verify that searched page is displayed

      #guid selling path Select all
      Then press on Get Started button

      #Q1
      And verify that question 1 is displayed: Which road conditions will you be driving on with these tires
      Then user selects Dry pavement
      Then user selects Rain
      Then user selects Ice/Snow/Slush
      Then user selects Gravel
      Then user selects Heavy Mud
      And preses on Next button for Qs

      #Q2
      When user is on Q2:  Do you currently put on different tires for the winter?
      Then select Yes I swap to winter
      And preses on Next button for Qs

      #Result after Yes I swap to winter
      When verify that CLP is open
      And verify that Winter tires are displayed Based in your responses, we recommend Winter tires
      And verify that Winter tires are displayed in Grid

      #back to Q1
      Then press on Change my responses
      And verify that question 1 is displayed: Which road conditions will you be driving on with these tires
      Then user selects Dry pavement
      Then user selects Rain
      Then user selects Ice/Snow/Slush
      Then user selects Gravel
      Then user selects Heavy Mud
      And preses on Next button for Qs

      #Q2
      When user is on Q2:  Do you currently put on different tires for the winter?
      Then select No My vehicle has one
      And preses on Next button for Qs

      #Q3
      Then Verify that Q3 is displayed  In Canada, we recommend changing your tires for the winter to provide superior driving performance in winter road conditions
      When user selects Show me winter tire
      Then preses on Next button for Qs
      When verify that CLP is open
      And verify that Winter tires are displayed Based in your responses, we recommend Winter tires
      And verify that Winter tires are displayed in Grid

      #back to Q1
      Then press on Change my responses
      And verify that question 1 is displayed: Which road conditions will you be driving on with these tires
      Then user selects Dry pavement
      Then user selects Rain
      Then user selects Ice/Snow/Slush
      Then user selects Gravel
      Then user selects Heavy Mud
      And preses on Next button for Qs

      #Q2
      When user is on Q2:  Do you currently put on different tires for the winter?
      Then select No My vehicle has one
      And preses on Next button for Qs

      #Q3
      Then Verify that Q3 is displayed  In Canada, we recommend changing your tires for the winter to provide superior driving performance in winter road conditions
      When user selects Show me Alternatives
      Then preses on Next button for Qs
      #When verify that CLP is open
      #And verify that All Weather tires are displayed Based in your responses, we recommend All Weather tires.
     # And verify that All Weather tires are displayed in Grid
And close the browser

