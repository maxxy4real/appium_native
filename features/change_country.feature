Feature: Change Country

Background: Clear Session
	Given I am on the Home page

@changeCountry
Scenario Outline: Changing country
	Given I open the change Country slate
	When I change the country to <country>
	And I click Done
	Then I should navigate to <subdomain> sub-domain
	And my country is <country>

Examples:
|country	        |subdomain |
|United States  	|US        |
|China          	|CN        |
|Japan           	|JP        |
|South Korea      	|KR        |
|Italy         	    |IT        |
|France        	    |FR        |
|Germany         	|DE        |
|Russian Federation |RU        |

@changeCountry
Scenario Outline: Change Country remembers page
Given I am already on the <page> page
When I open the change Country slate
And I change the country to <country>
And I click Done
Then I am still on the <page> page

Examples:
|page          |country	     	|
|store-locator |China        	|
|mens-coats    |Slovakia        |


@changeCountry
Scenario Outline: Changing country via URL
	When I change the URL via <subdomain>
	Then I should navigate to <subdomain> sub-domain
	And my country is <country>

Examples:
|country	    |subdomain |
|Brazil        	|BR        |
|India         	|IN        |

@manual @pending
Scenario Outline: Rest of the World is dispalyed for anywhere without a sub-domain
Given I am on the change Country slate
When I change the country to <country>
And I click Done
Then I should navigate to Rest of the World sub-domain

Examples:
|country	   	|
|?             	|