Feature: Check the create account functionality

  Background:
    Given open the site
    When user press on 'Log in' from header
    Then he navigates to 'Log in'page
    Then user press on create account button
    When  user is on Create account page

  Scenario: Navigate to crate account form
    Then user feels the First name with correct data
    Then user feels the Last name with correct data
    Then user feels the Email with correct data
    Then user feels the Password1 with valid data
    Then user feels the Password2 with valid data
    And press on 'Create account' page
    When user navigates to My account LP
    Then press on Log Out
    And close the browser

  Scenario Outline: Check validations for fields
    #check validation for blank fields
    Then user press on create account button
    And Verify validation messaged for each fields should be "Please enter.."

    #check validation for special symbols in First and last name
    Then Type First name with incorrect values like: '!@#$%^'
    Then Type last name with incorrece values like: '!@#$%^'
    And user feels the Email with correct data
    And user feels the Password1 with valid data
    And user feels the Password2 with valid data
    And user press on create account button
    And Verify validation message for First name should be "First name must only contain letters, periods, dashes, underscores and plus sign."
    And Verify validation message for Last name should be "Last name must only contain letters, periods, dashes, underscores and plus sign."


    #check the validations for First and last name with 1 and 2 symbols
    Then feels the First name with 1 symbol
    Then feel the Last name with 2 sybbol
    And user press on create account button
    And verify the validations for First name: Please your first name must be between 2-25 characters.
    And Verify the validaitons for Last name: Please your last name must be between 2-25 characters.

    #check the validaiton for First and Last names with 25 and 26 symbols
    Then feels the First name with 25 symbols
    Then feels the Last name with 26 symbols
    And user press on create account button

    #Email incorrect
    Then user feels the First name with correct data
    Then user feels the Last name with correct data
    Then entered incorrect email  like "asd@"
    And verify the validation message for  email filed: Please enter a valid email address

    #alredy registered email
    Then user feels the Email that is registered in the system like: ogboiko@gmail.com
    And user press on create account button
    Then verify the validation message for Email:  An account already exists for this email address; please sign in

    #password 1 less then 7
    Then fill the password1 with incorrect data like: 123456
    And verify the validation message: Please enter a password between 7-20 characters.

    #password 2 less then 7
    Then fill the password2 with data like: 123456
    And verify the valdiaiton message for password 2: Please enter a password between 7-20 characters.

    #password 1 more then 20
    Then fill the password1 with incorrect data like: 123456...21
    And verify the validation message: Please enter a password between 7-20 characters.

    #password 2 more then 20
    Then fill the password2 with data like: 123456...21
    And verify the valdiaiton message for password 2: Please enter a password between 7-20 characters.

   #password 1 != password 2
   Then fill password 1 with correct data like: 1234567
   And fill the password 2 with correct data like: 12345678
   And verify that password 2 has validaiton message: Passwords do not match.










