
Feature: Bag

Background: Clear Session
    Given I clear the local storage
    And I am on the Home page
    And I dismiss the build label
    And I dismiss the cookie label


@bag 
Scenario: Displays Empty Bag correctly for Unknown users
Given I am on the Bag page
And there are no items in my bag
Then the Empty bag message is displayed
And the Shop module is displayed
And the Signin button is displayed

@bag 
Scenario Outline: Displays Empty Bag correctly for Known Users
Given I sign in as a <user_type> user
When I am on the Bag page
Then the Empty bag message is displayed
And the Shop module is displayed

Examples:
|user_type  |
|no_bag  |


@bag
Scenario Outline: Displays Empty Bag correctly when items are Removed
Given I add a <product_type> item to my bag
And I can see the bag notification
And there are items in my bag
When I remove all items from my bag
Then the Shop module is displayed

Examples:
|product_type|
|beauty		 |


@bag
Scenario Outline: Guest can Add any type of item to bag
	Given I add a <product_type> item to my bag
	Then I can see the bag notification
	And there are items in my bag
	And Order summary information is correct
	And the payment and security modules are displayed

Examples:
|product_type|
|sized		 |
|beauty		 |
|mono		 |


@bag
Scenario Outline: Populated bag displays correctly for Known User
	Given I sign in as a <user_type> user
	When I am on the Bag page
	Then there are items in my bag
	And Order summary information is correct
	And the payment and security modules are displayed

Examples:
|user_type	 |
|with_bag	 |


@bag 
Scenario Outline: Can update quantity of items in the Bag
Given I sign in as a <user_type> user
And I am on the Bag page
And I dismiss the build label
When I tap edit on a bag item
And I update the quantity of the item
And I click Done
Then I can see the updated quantity in my bag
And I can see the updated order total in my bag

Examples:
|user_type |
|with_bag  |


@bag
Scenario Outline: Bag merging
Given I sign in as a <user_type> user
And I add a <product_type> item to my bag
When I clear the local storage
And I add a <different_product> item to my bag
And I am on the Bag page
And I click the Signin link
And I enter <user_type> user details
And I click the Signin submit button
Then I have multiple items in my Bag
And I remove all items from my bag

Examples:
|user_type  |product_type|different_product|
|no_bag  	|beauty		 |mono			   |


@pending
Scenario Outline: Merged bag is cleared after logout
Given I sign in as a <user_type> user
And I add a <product_type> item to my bag
And I clear the local storage
And I add a <different_product> item to my bag
And I am on the Bag page
And I click the Signin link
And I enter <user_type> user details
And I click the Signin submit button
And I have multiple items in my Bag
When I clear the local storage
And I am on the Bag page
Then the Shop module is displayed
Then the Empty bag message is displayed

Examples:
|user_type  |product_type|different_product|
|no_bag  |beauty		 |mono			   |


@bag
Scenario Outline: Bag translates Currency when I change country
Given I add a <product_type> item to my bag
And I can see the bag notification
And there are items in my bag
And the current bag currency is <bag_currency>
And I click the menu back button
When I am in <user_location>
And I can see the bag notification
And there are items in my bag
Then the current bag currency is <updated_currency>

Examples:
|product_type|bag_currency |user_location |updated_currency |
|beauty		 |£			   |United States |$				|


@bag
Scenario Outline: User cannot add more than 5 of same SKU
Given I add a <product_type> item to my bag
And I add more of the same product until I reach the maximum of <number>
Then I can see a notification message for max number of a items

Examples:
|product_type|number|
|beauty		 |5 	|
|sized		 |5 	|
|mono		 |5 	|


@bag
Scenario Outline: It notifies about restricted items when changing country
Given I add a <product_type> item to my bag
When I am in <user_location>
And I can see the bag notification
And there are items in my bag
And I click on the <tab_name> tab
Then the warning message is displayed
And I click on the <tab_name2> tab
And the warning message is displayed

Examples:
|product_type|user_location |tab_name  	|tab_name2 	|
|restricted	 |Qatar	        |Overview 	|Bag 		|



@bag 
Scenario Outline: It loads PDP when the Product title is tapped
Given I add a <product_type> item to my bag
When I can see the bag notification
And there are items in my bag
When I tap a product title in my bag
Then a PDP Page is loaded

Examples:
|product_type|
|sized		 |
|beauty		 |
|mono		 |

@bag @cleanup
Scenario Outline: Remove all items from Known User bag
  Given I sign in via API as a <user_type> user
  Then the user bag is emptied

Examples:
|user_type  |
|no_bag      |




