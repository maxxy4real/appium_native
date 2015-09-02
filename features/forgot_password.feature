Feature: Forgot Password

Background: Clear Session
    Given I am on the Home page
    And I dismiss the build label
    And Im Logged out of the app
	And the Signin panel is visible
	And I click the Signin link


@forgotpsw
Scenario Outline: It should display your email is invalid
    Given I click forgotten password link
    When I enter <invalid> email
    And I wait for validation response
    Then a warning message appears

Examples:
|invalid        |
|abcjsd@_101    |


@forgotpsw
Scenario Outline: It displays your email is not registered with My Acc
    Given I click forgotten password link
    When I enter <unregistered> email
    Then a warning message appears

Examples:
|unregistered        |
|newuser@gmail.com   |


@forgotpsw
Scenario Outline: It allows registered email and displays a green tick
    Given I click forgotten password link
    When I enter <registered> email
    And I tap on the active Next button
    Then I should see forgotten password page
    And I click Done

Examples:
|registered      |
|test@112.com    |


