Feature: Wheels By Vehicle and Wheels by Size

  Background:
    Given open the site
    Then user presses on Wheels tab on widget


  Scenario: shop wheels by vehicle
    Then user presses on Shop Wheels By Vehicle
    Then select Year for wheels by vehicle
    Then select Make for wheels by vehicle
    Then select Model for wheels by vehicle
    Then select Option for wheels by vehicle
    Then select Size for wheels by vehicle
    And verify that CLP is open
    And verify searching car by Year and Make for wheels
    And close the browser


  Scenario: shop wheels by size
    Then user press on Shop Wheels by size tab
    Then select Bolt Pattern
    Then select Wheel Diameter
    And verify that CLP is open
    And verify searching Wheels size

    Scenario: