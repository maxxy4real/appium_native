Feature: Checkout

Background: Clear Session
    Given I clear the local storage
    And I am on the Home page
    And I dismiss the build label
    And I dismiss the cookie label


@checkout @der
Scenario Outline: Registered User can Checkout for Delivery
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I enter <user_type> user details for Checkout
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I use my default Shipping address
    And I use my default card details 
    When I click Order
    Then the Order Confirmation is displayed
    And I can go to My Orders

Examples:
|user_location  |product_type   |user_type  |shipping_country   |shipping_type  |
|United Kingdom |beauty          |known      |United Kingdom     |default        |


@checkout
Scenario Outline: Guest User can Checkout for Delivery
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I enter <user_type> user details for Checkout
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I add a <address_country> Shipping address
    And I tap Payment Method
    And I enter my card details 
    And I use my default Billing address
    When I click Order
    Then the Order Confirmation is displayed

Examples:
|user_location  |product_type   |user_type  |shipping_country   |shipping_type  |address_country  |
|United Kingdom |beauty         |guest      |United Kingdom     |saturday       |United Kingdom   |


@checkout
Scenario Outline: Guest User can Checkout for Store Collection
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I enter <user_type> user details for Checkout
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I Select a collection store
    And I tap Payment Method
    And I enter my card details 
    And I enter a <billing_country> Billing address
    When I click Order
    Then the Order Confirmation is displayed

Examples:
|user_location  |product_type   |user_type  |shipping_country   |shipping_type  |billing_country   |
|United Kingdom |beauty         |guest      |United Kingdom     |collect        |United Kingdom    |


@checkout
Scenario Outline: New Users can Register and Checkout
    Given I go to My Account
    And I tap register account CTA
    And I enter all the <user> data in the Registration form
	And I enter email address
	And I tap on the active Next button
	And I click Done
    And I am on the Home page
    And I dismiss the build label
    And I dismiss the cookie label
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I add a <address_country> Shipping address
    When I tap Payment Method
    And I enter my card details
    And I click Done
    And I click Order
    Then the Order Confirmation is displayed
    And I can go to My Orders

Examples:
|user	|product_type	|shipping_type	|shipping_country	|address_country	|
|UKuser	|beauty			|saturday		|United Kingdom		|United Kingdom		|


@checkout
Scenario Outline: Viewing order details before closing the order confirmation
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I enter <user_type> user details for Checkout
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I use my default Shipping address
    And I use my default card details
    When I click Order
    Then the Order Confirmation is displayed
    When I click View Order Details
    Then I see the Order Details slate
    And my order details are correct
    When I close the Order Details slate
    Then I can go to My Orders

Examples:
|user_location  |product_type   |user_type  |shipping_country   |shipping_type  |
|United Kingdom |sized          |known      |United Kingdom     |default        |


@checkout @alipay
Scenario Outline: Registered User can Checkout with Alipay for Delivery
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I enter <user_type> user details for Checkout
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I use my default Shipping address
    And I tap Payment Method
    And I select Alipay
    And I enter my Alipay details
    When I click Order
    And I am redirected to the Alipay processing page
    And Alipay successfully processes my payment
    Then the Order Confirmation is displayed

Examples:
|user_location  |product_type   |user_type  |shipping_country   |shipping_type  |
|China          |mono         |known      |China              |default        |


@checkout @alipay
Scenario Outline: Registered User redirected on Failed Alipay checkout
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I enter <user_type> user details for Checkout
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I use my default Shipping address
    And I tap Payment Method
    And I select Alipay
    And I enter my Alipay details
    When I click Order
    And I am redirected to the Alipay processing page
    And Alipay fail to process my payment
    Then I am redirected to the Checkout page
    And a failed checkout error message is displayed

Examples:
|user_location  |product_type   |user_type  |shipping_country   |shipping_type  |
|China          |mono           |known      |China              |default        |

