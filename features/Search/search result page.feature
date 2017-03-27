Feature: Search result page

  Background:
    Given open the site
    Then user presses on Search icon from header


    Scenario: Navigate to Search result page for wheels
      When user types the Wheels in search field
      Then verify that search pop-up is displayed
      Then verify that Products section is displayed
      Then verify that Other Popular section is displayed
      And Verify that Wheels is include in Other popular search
      Then press on Enter/Search
      And verify that Search result page is displayed
      And verify that results on the page are for search word

      Scenario: check Filter result functionality by brand and diameter wheels
        When user types the Wheels in search field
        Then verify that search pop-up is displayed
        Then verify that Products section is displayed
        Then verify that Other Popular section is displayed
        And Verify that Wheels is include in Other popular search
        Then press on Enter/Search
        Then verify that Filter result is displayed
       #brand
        And press on Brand filter from Filter result section for wheels
        And select the option for brand wheel
        Then verify that only products with selected option brand is displayed on the grid
        And uncheck selected option for brand
        #diameter
        And press on Diameter filter from Filter result section for wheels
        And select the option for diameter wheel
        Then verify that products has selected diameter option on the grid
        And uncheck selected option diameter


