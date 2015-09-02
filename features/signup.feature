Feature: Sign Up

Background: Clear Session
    And I am on the Home page
    And I dismiss the build label
    And Im Logged out of the app
    And the Signin panel is visible
    When I tap register account CTA
    Then registration slate is displayed


@reg
Scenario Outline: Sucessful Registration for New Users
	When I enter all the <user> data in the Registration form
	And I enter email address
	And I tap on the active Next button
	And I click Done
	Then I am registered and logged in automatically


Examples:
|user              |
|UKuser            |
|ChinaUser         |
|USUser            |
|JapanUser         | 
|KoreaUser         |       


@reg
Scenario Outline: It verifies email address format
    When I enter <invalid> email in Registration form
    And I enter <valid> password format
    Then a warning message appears

Examples:
|invalid       |valid        |
|abcjsd@_101   |password1    |


@reg
Scenario Outline: It verifies if email address is not in use
	When I enter <valid> email in Registration form
	Then displays a tick after validating the field

Examples:
|valid               |
|newuser@gmail.com   |


@reg
Scenario Outline: It prompts user to Signin if email is already registered
	When I enter <registered> email in Registration form
	Then a warning message appears
	When I click Signin CTA
	Then the Signin slate appears
	And email is prepopulated with <registered>
	And I insert <correct> password
    And I click the Signin submit button
    Then I am logged in

Examples:
|registered   		|correct        |
|register@gmail.com	|password1      |


@reg
Scenario Outline: It respects the password field rules
	When I enter <lessthan8char> password format
	Then a warning message appears
	When I enter <morethan15char> password format
	Then a warning message appears
	When I enter <nocharacter> password format
	Then a warning message appears
	When I enter <nonumber> password format
	Then a warning message appears

Examples:
|lessthan8char  |morethan15char    |nocharacter   |nonumber    |
|Today1         |IncorrectPasswo1  |7691037404    |passwordone |



@reg
Scenario Outline: It highlights incomplete fields on clicking Next button
	When I enter all the <user> data in the Registration form
	When I tap on the disabled Next button
	Then all the incomplete fields are highlighted

Examples:
|user              |
|Incompleteuser    |


@reg
Scenario Outline: It allows new user to Subscribe for email and register successfully
	When I enter all the <user> data in the Registration form
	And I enter email address
	And I tap on the active Next button
	Then Burberry updates is shown
	When I subscribe for email
	And I click Done
	Then I am registered
	And I am subscribed

Examples:
|user           |
|UKuser         |


@reg
Scenario Outline: It displays error messages when Mandatory checkboxes are not selected
	Given I am on the Home page
	When I open the change Country slate
	And I change the country to <country>
	And I click Done
	And I dismiss the build label
    And I click the Account Icon
    When I tap register account CTA
    Then registration slate is displayed
    When I enter all the <user> data in the Registration form
    And I enter email address
    And I tap on the disabled Next button
	Then all the incomplete fields are highlighted

Examples:
|country	     |user       |
|South Korea     |KoreaUser  |


@reg
Scenario Outline: It allows Korean user to register successfully
    Given I am on the Home page
	When I open the change Country slate
	And I change the country to <country>
	And I click Done
	And I dismiss the build label
    And I click the Account Icon
    When I tap register account CTA
    Then registration slate is displayed
    And I enter all the <user> data in the Registration form
    And I enter email address
	And I select the Mandatory checkboxes
	When I tap on the active Next button
	And I select the Optional checkboxes
	And I click Done
	Then I am registered and logged in automatically

Examples:
|country	     |user       |
|South Korea     |KoreaUser  |
	



