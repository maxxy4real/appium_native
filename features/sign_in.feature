Feature: Sign In

Background: Clear Session
    Given I clear the local storage
    Given I am on the Home page
    And I dismiss the build label
	And the Signin panel is visible
	And I click the Signin link

@signin
Scenario Outline: It should allow registered user to login successfully
    Given I enter <user_type> user details
    And I click the Signin submit button
    Then I am logged in

Examples:
|user_type   |
|known       |


@signin
Scenario Outline: It should NOT allow users that are NOT registered to login
    Given I enter <user_type> user details 
    And I click the Signin submit button
    Then an error message appears

Examples:
|user_type  |
|guest      |


@signin
Scenario Outline: It validates incorrect email address when entered
    Given I enter <invalid> email
    Then a warning message appears

Examples:
|invalid        |
|abdhfg@j-@'    |


@signin
Scenario Outline: It prompts to create an account when email is not found
    Given I enter <unknown> email
    Then a warning message appears
    And I am prompt to register as a new user

Examples:
|unknown               |
|Tester001@test.com    |