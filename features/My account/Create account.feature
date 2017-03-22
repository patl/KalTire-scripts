Feature: Check the create account functionality

  Background:
    Given open the site
    When user press on 'Log in' from header
    Then he navigates to 'Log in'page
    Then user press on create account button
    When  user is on Create account page

  Scenario: Navigate to crate account form
    Then user feels the form with valid data
    And press on 'Create account' page
    When user navigates to My account LP
    Then press on Log Out
    And close the browser





