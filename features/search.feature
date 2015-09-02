Feature: Search

Background: Clear Session
    Given Im Logged out of the app
    And I am on the Home page
    And I dismiss the build label
    And I dismiss the cookie label


@search @smoke
Scenario: the Search Slate can open
	Given I open the search slate

@search @smoke
Scenario: Open the Search Slate via Taxonomy Cells
	Given I am on a page with a taxonomy cell
	And the search cta is visible in the taxonomy cell
	When I tap the taxonomy search cta
	Then the search slate opens

@search @smoke
Scenario Outline: Searching for non-product pages
	Given I open the search slate
	And I search for "<term>"
	Then I Navigate to the Shipping sub page

Examples:
|term		|
|Shipping	|


@search @smoke
Scenario Outline: Searching for a product range of more than 20 products
	Given I open the search slate
	And I search for "<term>"
	Then a PLP loads
	And the product range search term is displayed
	And the total number of products is displayed
	And 20 products are initially loaded
	And I scroll to the bottom of the PLP page
	Then more products are loaded

Examples:
|term	|
|Bags	|


@search @smoke
Scenario Outline: Searching for a term that returns a single product
	Given I open the search slate
	And I search for "<term>"
	Then I am directed to that single PDP

Examples:
|term			|
|39713471		|


@search @smoke
Scenario Outline: Search stores previous Valid searches as Recent Searches
	Given I open the search slate
	And I search for "<term>"
	And I open the search slate
	Then the valid term is displayed in Recent searches

Examples:
|term	|
|trench	|


@search @smoke
Scenario Outline: Nonexistent terms are not stored as recent searches
	Given I open the search slate
	And I search for "<term>"
	And the no result message is displayed
	And I close the search slate
	When I tap on search
	Then the nonexistent term is not displayed in Recent searches

Examples:
|term			|
|derinruban999	|


@search @smoke
Scenario Outline: Search defaults to List view
	Given I open the search slate
	When I search for "<term>"
	Then a PLP loads
	And the search results load in List View
	And I can see listed product decriptions

Examples:
|term	|
|Bags	|
|shoes	|

@search @smoke
Scenario Outline: Search defaults to List view
	Given I open the search slate
	When I search for "<term>"
	Then a PLP loads
	When I click the View facet
  	And I click Gallery
	Then the listed product decriptions are no longer visible

Examples:
|term	|
|Bags	|
|shoes	|

@search @smoke @broken
Scenario Outline: Auto-corrects misspelled search terms
	Given I open the search slate
	When I search for "<term>"
	Then a PLP loads
	And the auto corrected valid term is displayed
	And I tap the search term
	And the valid term is displayed in Recent searches

Examples:
|term   |
|tench	|


@search @smoke
Scenario: Displays search box at all taxonomy levels
	When I open the navigation menu
	And I navigate to the next taxonomy level
	Then the search field is visible at the top of the navigation menu
 

@search @smoke
Scenario: allows using Recent search terms
	Given I open the search slate
	And I have recent search terms
	And I re-enter a recent search term
	And a PLP loads
	When I tap the search term 
	Then the re-entered term is at the top of Recent searches


@pending @smoke
Scenario: allows using Recent search terms 2
    And I open the search slate
	Given I have recent search terms
	And I re-enter a recent search term
	And a PLP loads
	When I tap the search term 
	Then the re-entered term is only saved once in Recent searches
	And the re-entered term is at the top of Recent searches
	And I click the term at the top of Recent searches
	Then the search slate closes


@search @smoke @xsim
Scenario: anchors back to the same place on the results page
	Given I open the search slate
	And Searching for a product range of more than 20 products
	And a PLP loads
	And I tap item number 4 in the shelf
	And a PDP Page is loaded
	When I go back
	Then I return to the same point on the PLP


@search @smoke
Scenario Outline: allows special character searches in other langauges
	Given I open the navigation menu
	And I change language to <language>
	When I open the search slate
	And I search for "<term>"
	Then a PLP loads

Examples:
|language |term |
|Español  |pitón|


@search @smoke
Scenario Outline: allows changing country and viewing products in other currencies
	Given I open the change Country slate
	And I change the country to <country>
	And I click Done
	And I open the search slate
	When I search for a <item_type> item SKU
	And a PDP Page is loaded
	Then the price is shown in Dollars

Examples:
|country        |item_type		|
|United States	|single-item	|
