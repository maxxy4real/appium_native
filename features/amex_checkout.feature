 Feature: Amex Checkout

Background: Clear Session
    Given Im Logged out of the app
    And I am on the Home page
    And I dismiss the build label
    And I dismiss the cookie label

@amex
Scenario Outline: AMEX Express checkout option should be available on the e-mail slate of a guest user
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    When I enter <user_type> user details for Checkout
    And I click continue button on the checkout slate
    Then I see Amex payment option

Examples:
|user_location  |product_type   |user_type  |  
|United States  |sized          |guest      |


@amex
Scenario Outline: AMEX Express checkout should be visible on the Payment Method slate of a guest user
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I enter <user_type> user details for Checkout
    And I click continue button on the checkout slate
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I add a <address_country> Shipping address
    When I tap Payment Method
    Then I see Amex payment option
   
Examples:
|user_location  |product_type   |user_type  |shipping_country |shipping_type  |address_country  |
|United States  |beauty         |guest      |United States    |next day       |United States    |


@amex
Scenario Outline: Amex Express checkout authentication should NOT overwrite shipping address for Guest user
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I enter <user_type> user details for Checkout
    And I click continue button on the checkout slate
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I add a <address_country> Shipping address
    When I tap Payment Method
    And I tap Amex EXPRESS checkout
    Then I should be directed to Amex EXPRESS checkout page
    When I enter amex_user card details
    And I should be brought back into the mobile app
    And I dismiss the build label
    Then I see that Amex Billing address does not overwrite shipping address

Examples:
|user_location  |product_type    |user_type  |shipping_country |shipping_type  |address_country  |
|United States  |beauty          |guest      |United States    |next day       |United States    |


@amex
Scenario Outline: It allows Guest user to complete order successfully via AMEX EXPRESS checkout
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    When I enter <user_type> user details for Checkout
    And I click continue button on the checkout slate
    Then I see Amex payment option
    When I tap Amex EXPRESS checkout
    Then I should be directed to Amex EXPRESS checkout page
    And I enter amex_user card details
    And I should be brought back into the mobile app
    And I dismiss the build label
    And I see that the shipping address is the billing address return from AMEX EXPRESS checkout
    When I click Order
    Then the Order Confirmation is displayed

Examples:
|user_location  |product_type   |user_type  |shipping_country |shipping_type  |address_country  |
|United States  |beauty         |guest      |United States    |default        |United States    |


@amex
Scenario Outline: Change Country during checkout should NOT display amex for Guest user
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I enter <user_type> user details for Checkout
    And I click continue button on the checkout slate
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I add a <address_country> Shipping address
    When I tap Payment Method
    Then I should not see Amex payment option

Examples:
|user_location  |product_type   |user_type  |shipping_country |shipping_type  |address_country  |
|United States  |beauty         |guest      |United Kingdom   |default        |United Kingdom   |


@amex
Scenario Outline: AMEX Express checkout option should NOT be available on the e-mail slate of a registered user
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    When I enter <user_type> user details for Checkout
    Then I should not see Amex payment option

Examples:
|user_location  |product_type   |user_type  |  
|United States  |beauty         |known      |


@amex
Scenario Outline: AMEX Express checkout should be visible on the Payment Method slate of a registered user
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I enter <user_type> user details for Checkout
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I use my default Shipping address
    When I tap Payment Method
    Then I see Amex payment option

Examples:
|user_location  |product_type   |user_type  |shipping_country |shipping_type  |address_country  |
|United States  |beauty         |amex       |United States    |default        |United States    |


@amex
Scenario Outline: Amex Express checkout authentication should NOT overwrite shipping address for Registered user
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I enter <user_type> user details for Checkout
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I add a <address_country> Shipping address
    When I tap Payment Method
    And I tap Amex EXPRESS checkout
    Then I should be directed to Amex EXPRESS checkout page
    When I enter amex_user card details
    And I should be brought back into the mobile app
    And I dismiss the build label
    Then I see that Amex Billing address does not overwrite shipping address

Examples:
|user_location  |product_type   |user_type  |shipping_country |shipping_type   |address_country  |
|United States  |beauty         |amex       |United States    |default         |United States    |


@amex
Scenario Outline: Amex EXPRESS checkout should auto populate shipping address and default to cheapest shipping option
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    When I enter <user_type> user details for Checkout
    And I click continue button on the checkout slate
    Then I see Amex payment option
    When I tap Amex EXPRESS checkout
    Then I should be directed to Amex EXPRESS checkout page
    And I enter amex_user card details
    And I should be brought back into the mobile app
    And I dismiss the build label
    And I see that the shipping address is the billing address return from AMEX EXPRESS checkout

Examples:
|user_location  |product_type   |user_type  |shipping_country |shipping_type  |address_country  |
|United States  |beauty         |guest      |United States    |default        |United States    |


@amex
Scenario Outline: It allows Registered user to complete order successfully via AMEX EXPRESS checkout
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I enter <user_type> user details for Checkout
    And I click continue button on the checkout slate
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I add a <address_country> Shipping address
    When I tap Payment Method
    And I tap Amex EXPRESS checkout
    Then I should be directed to Amex EXPRESS checkout page
    And I enter amex_user card details
    And I should be brought back into the mobile app
    And I dismiss the build label
    And I see that Amex Billing address does not overwrite shipping address
    When I click Order
    Then the Order Confirmation is displayed

Examples:
|user_location  |product_type   |user_type  |shipping_country |shipping_type  |address_country  |
|United States  |beauty         |amex       |United States    |default        |United States    |


@amex
Scenario Outline: It should allow registered user to Save AMEX card details
    Given I am in <user_location>
    Given I go to My Account
    And I tap register account CTA
    And I enter all the <user> data in the Registration form
	And I enter email address
	And I tap on the active Next button
	And I click Done
	And I click the toolbar navigation
	Given I open the search slate
	And I search for "<term>"
	And I click add to bag
	And I tap Checkout
	And I add a <address_country> Shipping address
	When I tap Payment Method
	And I tap Amex EXPRESS checkout
	Then I should be directed to Amex EXPRESS checkout page
	And I enter amex_user card details
    And I should be brought back into the mobile app
    And I dismiss the build label
    And I select option to save amex card details
    When I click Order

Examples:
|user_location |user   |term     |product_type  |user_type  |shipping_country |address_country  |
|United States |USUser |38019571 |beauty        |guest      |United States    |United States    |


@amex
Scenario Outline: It should allow registered user to retrieve save card and checkout faster
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    When I enter <user_type> user details for Checkout
    And I click the Signin submit button
    And I used my saved card details
    When I click Order
  
Examples:
|user_location |product_type |user_type          |shipping_country |address_country |
|United States |beauty       |amexwith_savedCard |United States    |United States   |


@amex
Scenario Outline: Cancelling AMEX EXPRESS checkout should return user to app payment method
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I enter <user_type> user details for Checkout
    And I click continue button on the checkout slate
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I use my default Shipping address
    When I tap Payment Method
    And I tap Amex EXPRESS checkout
    Then I should be directed to Amex EXPRESS checkout page
    And I Cancel Amex Express checkout
    Then I see Amex payment option
  
Examples:
|user_location |product_type  |user_type |shipping_country |shipping_type  |address_country |
|United States |beauty        |amex      |United States    |default        |United States   |


@amex
Scenario Outline: Change Country during checkout should NOT display amex for Registered user
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I enter <user_type> user details for Checkout
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I use my default Shipping address
    When I tap Payment Method
    Then I should not see Amex payment option

Examples:
|user_location  |product_type   |user_type  |shipping_country |shipping_type  |address_country  |
|United States  |beauty         |amex       |United Kingdom   |default        |United Kingdom   |


@amex
Scenario Outline: Amex Details should be removed when a user change country having gone through verification by amex
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    When I enter <user_type> user details for Checkout
    And I click continue button on the checkout slate
    Then I see Amex payment option
    When I tap Amex EXPRESS checkout
    Then I should be directed to Amex EXPRESS checkout page
    And I enter amex_user card details
    And I should be brought back into the mobile app
    And I dismiss the build label
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    When I tap Payment Method
    Then I should not see Amex payment option
  
Examples:
|user_location  |product_type   |user_type  |shipping_country |shipping_type  |address_country  |
|United States  |beauty         |guest      |United Kingdom   |default        |United Kingdom   |


@amex
Scenario Outline: Amex Express checkout authentication should NOT overwrite collect-in-store
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I enter <user_type> user details for Checkout
    And I click continue button on the checkout slate
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I Select a collection store
    When I tap Payment Method
    And I tap Amex EXPRESS checkout
    Then I should be directed to Amex EXPRESS checkout page
    When I enter amex_user card details
    And I should be brought back into the mobile app
    And I dismiss the build label
    Then I see that Amex Billing address does not overwrite shipping address

Examples:
|user_location  |product_type    |user_type  |shipping_country |shipping_type  |address_country  |
|United States  |beauty          |guest      |United States    |collect        |United States    |


@amex
Scenario Outline: It allow user to enter title to an incomplete form received from Amex
    Given I am in <user_location>
    And I add a <product_type> item to my bag
    And I tap Checkout
    And I enter <user_type> user details for Checkout
    And I click continue button on the checkout slate
    And I click the Signin submit button
    And I select <shipping_country> as the Shipping destination
    And I select the <shipping_type> Shipping option
    And I Select a collection store
    When I tap Payment Method
    And I tap Amex EXPRESS checkout
    Then I should be directed to Amex EXPRESS checkout page
    When I enter incomplete amex_user details
    And I should be brought back into the mobile app
    And I dismiss the build label
    Then I see that Amex Billing address does not overwrite shipping address

Examples:
|user_location  |product_type    |user_type  |shipping_country |shipping_type  |address_country  |
|United States  |beauty          |guest      |United States    |collect        |United States    |


