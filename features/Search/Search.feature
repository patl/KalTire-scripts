Feature: testing the search functionality
  Background:
    Given open the site
    Then user presses on Search icon from header

    Scenario: Check the search suggestions functionality
     #weels
      When user types the Wheels in search field
      Then verify that search pop-up is displayed
      Then verify that Products section is displayed
      Then verify that Other Popular section is displayed
      And Verify that Wheels is include in Other popular search

      #tires
      When user types the Tires in search field
      Then verify that search pop-up is displayed
      Then verify that Products section is displayed
      Then verify that Other Popular section is displayed
      And Verify that Tires is include in Other popular search

      #product name
      When user types the Product Name like x-ice in search field
      Then verify that search pop-up is displayed
      Then verify that Products section is displayed
      And verify that product x-ice is exists in each products name




