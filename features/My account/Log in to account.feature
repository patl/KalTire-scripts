Feature: Check the Log In section on my acc
Background:
  Given open the site
  When user press on 'Log in' from header
  Then he navigates to 'Log in'page


  Scenario: Check the login functionality

    And user fills the Email on login page
    And user fills password on login page
    And he press on Log In button from Log In page
    Then user navigates to My account LP verify greeting
    And press on Log Out

  Scenario: Check the validations on Log In page
    #validations for blank fields
    Then he press on Log In button from Log In page
    And verify the validation messages for Log in
    And verify the validation message for Password
    And user fills the Email on login page

    #validations for password <7
    Then Entered incorrect password <7
    And he press on Log In button from Log In page
    When validation message is displayed Please enter a password between 7-20 characters.

    #validations for paddword >20
    Then entered incorrect password >20
    And  he press on Log In button from Log In page
    When validation message is displayed Please enter a password between 7-20 characters.

    #validations for email field: ogboiko@
    Then user fills password on login page
    And fills the email on Login page with incorrect email ogboiko@
    Then he press on Log In button from Log In page
    And verify error message  Please enter a valid email address

    #validation messages for non existing acount
  Then fills the email on login page with non existing email in the system
    And user fills password on login page
    Then he press on Log In button from Log In page
    And verify the error message Sorry, this does not match our records. Check your spelling and try again.