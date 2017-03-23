Feature: Check the change password functionality

  Background:
    Given open the site
    When user press on 'Log in' from header
    Then he navigates to 'Log in'page
    Then user press on create account button
    When  user is on Create account page
    Then user fills the First name with correct data
    Then user fills the Last name with correct data
    Then user fills the Email with correct data
    Then user fills the Password1 with valid data
    Then user fills the Password2 with valid data
    And press on 'Create account' button on create acc page
    Then user navigates to My account LP verify greeting


  Scenario: Change the password
    Then press on account setting from my account page
    And press on Edit for password
    And fill the Current Password fled with password
    And fill the New Password fled with new password
    And fill the Repeat New Password fled with new password
    And Save changes
    Then press on Log Out
    When user press on 'Log in' from header
    And Log in with new password
    And he press on Log In button from Log In page
    And press on Log Out
    And close the browser

    Scenario: verify validation form Change password fidel
     Then press on account setting from my account page
     And press on Edit for password

     #blank field
     And Save changes
     Then verify validation message for Current Password
     Then verify validation message for New Password
     Then verify validation message for Repeat New Password

     #fields <7
     Then fill the Current password with <7
     And fill the New Password <7
     And fill the Repeat Password <7
     And Save changes
     Then verify validation message for Current password Please enter a password between 7-20 characters.
     Then verify validation message for New password Please enter a password between 7-20 characters.
     Then verify validation message for Repeat password Please enter a password between 7-20 characters.

     #fields >20
     Then fill the Current password with >20
     And fill the New Password >20
     And fill the Repeat Password >20
     And Save changes
     Then verify validation message for Current password Please enter a password between 7-20 characters.
     Then verify validation message for New password Please enter a password between 7-20 characters.
     Then verify validation message for Repeat password Please enter a password between 7-20 characters.

     #current doesn match
     Then the Current password with any valid data
     Then fill the New Password fled with new password
     And fill the Repeat New Password fled with new password
     And Save changes
     Then verify the validation message for Current password Does not match the current password

     #new passwords doesn't match
     Then fill the Current Password fled with password
     Then fill the New Password fled with new password
     And fill the repeat password with valid data != New password field
     And Save changes
     And verify validation message for Repeat new password Passwords do not match.
     And close the browser





