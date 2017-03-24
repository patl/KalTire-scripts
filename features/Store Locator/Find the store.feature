Feature: Navigate to Store locator page

  Background:
   Given open the site
   Then user navigates to Location page from menu
   And Verify that user is on Store locator page


   Scenario: Check the search functionality and Store Details page
      And User fills the search field on store locator page with Alberta
      Then Press on Search button for search
      And verify that Alberta stores are displayed
      Then press on Alberta store and from the list
      And verify that pop-up is displayed on the map
      Then User press on Detail button from the pop-up
      And verify that Location detail page is displayed
      Then press on Back to store page
      And Verify that user is on Store locator page
      And close the browser

     Scenario: Check the List of all stores
       Then User press on List of all Locations
       And verify that user is on All location page
       And verify that Alberta is expended
       And navigate back to Location page
       And Verify that user is on Store locator page
       And close the browser