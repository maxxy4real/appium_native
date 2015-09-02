Feature: Store Associate

Background: Clear Session
    Given I am on the Home page
    And I dismiss the build label
    And Im Logged out of the app

@store_associate
Scenario Outline: It allows store associate to Login with valid credentials
    Given I am on associate Login page
    And I dismiss the build label
    When I enter <staff_user> user details
    And I click associate Signin button
    Then I see Login Indicator displaying Associate Number
    And I see signout icon at the bottom of the view port

Examples:
|staff_user        |
|store_associate   |


@store_associate
Scenario Outline: Store associate sign out alert
    Given I am on associate Login page
    And I dismiss the build label
    When I enter <staff_user> user details
    And I click associate Signin button
    Then I see Login Indicator displaying Associate Number
    And I see signout icon at the bottom of the view port
    When I click signout icon
    Then I see signout dialog alert box
    And I click NO to close alert dialog box
    And I click signout icon
    And I click YES to return to Sign In Page

Examples:
|staff_user        |
|store_associate   |


@store_associate
Scenario Outline: It allows user to see associateID and storeNumber on checkout confirmation page of a guest user
    Given I am on associate Login page
    And I dismiss the build label
    When I enter <staff_user> user details
    And I click associate Signin button
    Then I see Login Indicator displaying Associate Number
    And I see signout icon at the bottom of the view port
    And I add a <product_type> item to my bag
    And I tap Checkout
    When I enter <user_type> user details for Checkout
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I add a <address_country> Shipping address
    And I tap Payment Method
    And I enter my card details 
    And I use my default Billing address
    And I click Order
    Then I see associate ID and store number

Examples:
|staff_user      |user_type |product_type |shipping_country |shipping_type |address_country |
|store_associate |guest     |beauty       |United Kingdom   |saturday      |United Kingdom  |


@store_associate
Scenario Outline: It allows user to see associateID and storeNumber on checkout confirmation Page of a registered user
    Given I am on associate Login page
    And I dismiss the build label
    When I enter <staff_user> user details
    And I click associate Signin button
    Then I see Login Indicator displaying Associate Number
    And I see signout icon at the bottom of the view port
    And I add a <product_type> item to my bag
    And I tap Checkout
    When I enter <user_type> user details for Checkout
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I use my default Shipping address
    And I use my default card details 
    And I click Order
    Then I see associate ID and store number

Examples:
|staff_user      |user_type |product_type |shipping_country |shipping_type |address_country |
|store_associate |known     |beauty       |United Kingdom   |default       |United Kingdom  |


@store_associate
Scenario Outline: Its should remove associate ID's from Order
    Given I am on associate Login page
    And I dismiss the build label
    When I enter <staff_user> user details
    And I click associate Signin button
    Then I see Login Indicator displaying Associate Number
    And I see signout icon at the bottom of the view port
    And I add a <product_type> item to my bag
    And I tap Checkout
    When I enter <user_type> user details for Checkout
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I add a <address_country> Shipping address
    And I tap Payment Method
    And I enter my card details 
    And I use my default Billing address
    And I click Order
    Then I see associate ID and store number
    And I click Done
    When I click the menu back button
    And I click signout icon
    Then I click YES to return to Sign In Page
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I add a <address_country> Shipping address
    And I tap Payment Method
    And I enter my card details 
    And I use my default Billing address
    When I click Order
    Then the order associated with the ID should be removed

Examples:
|staff_user      |user_type |product_type |shipping_country |shipping_type |address_country |
|store_associate |guest     |beauty       |United Kingdom   |default       |United Kingdom  |


@store_associate
Scenario Outline: Change Country persist associate ID and store number
    Given I am on associate Login page
    And I dismiss the build label
    When I enter <staff_user> user details
    And I click associate Signin button
    Then I see Login Indicator displaying Associate Number
    And I see signout icon at the bottom of the view port
    And I add a <product_type> item to my bag
    And I tap Checkout
    When I enter <user_type> user details for Checkout
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I use my default card details
    And I click Order
    Then I see associate ID and store number

Examples:
|staff_user      |user_type |product_type |shipping_country |shipping_type |address_country |
|store_associate |known     |beauty       |United States    |default       |United States   |


@store_associate
Scenario Outline: Login indicator verification on all pages
    Given I am on associate Login page
    And I dismiss the build label
    When I enter <staff_user> user details
    And I click associate Signin button
    Then I see Login Indicator displaying Associate Number
    And I see signout icon at the bottom of the view port
    When I open the search slate
    And I search for "<term>"
    Then I see Login Indicator displaying Associate Number
    And I see signout icon at the bottom of the view port
    And I add a <product_type> item to my bag
    And I tap Checkout
    When I enter <user_type> user details for Checkout
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I use my default card details
    And I click Order
    Then I see associate ID and store number

Examples:
|staff_user       |user_type  |product_type  |shipping_country   |shipping_type  |address_country  |term |
|store_associate  |known      |beauty        |United Kingdom     |default        |United Kingdom   |Bags |





