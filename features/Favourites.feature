Feature: Favourites

Background: Clear Session
    Given I am on the Home page
    And I dismiss the build label
    And Im Logged out of the app


@Fav
Scenario: It allows items to be added to Favourites from PLP
    Given I am on a PLP
    And I dismiss the build label
    And on mobile I can see a Detail View link
    And on mobile I click Detail View
    And I tap the Favourites CTA
    And MyAccount shows as Favourites momentarily
    And I see the icon shows as favourited
    When I click My Favourited icon
    And I tap the Favourites Tab
    Then I see Favourited item
   
@Fav
Scenario: It allows items to be added to Favourites From PDP
    Given I am on a Product Details Page
    And I dismiss the build label
    And a PDP Page is loaded
    When I tap the Favourite icon on PDP page
    And MyAccount shows as Favourites momentarily
    Then I see the icon shows as favourited
    And I click My Favourited icon
    And I tap the Favourites Tab
    And I see Favourited item
    And I see sign in to save your favourites
    And Share favourites panel is available
    When I tap Share favourites button
    Then I see the Share favourites slate


@Fav
Scenario Outline: It displays empty list for registered user with NO favourite items
    Given I go to My Account     
    And I tap the Favourites Tab
    And I click the Signin link
    When I enter <user_type> user details
    And I click the Signin submit button
    Then I see no Favourited items
    And I tap Overview
    And I see No Favourited items on Overview page

Examples:
|user_type     |
|no_fav        |


@Fav
Scenario Outline: It displays favourited items for registered user with favourited items
    Given I am on a Product Details Page
    And I dismiss the build label
    And a PDP Page is loaded
    When I tap the Favourite icon on PDP page
    And MyAccount shows as Favourites momentarily
    Then I see the icon shows as favourited
    And I click My Favourited icon
    And I click the Signin link
    And I enter <user_type> user details
    And I click the Signin submit button
    And I tap the Favourites Tab
    And I see Favourited item
    And Share favourites panel is available
    When I tap Share favourites button
    Then I see the Share favourites slate

Examples:
|user_type      |
|with_fav       |


@Fav
Scenario Outline: It allows users to navigate to PDP from favourited list items
    Given I am on a Product Details Page
    And I dismiss the build label
    And a PDP Page is loaded
    And I go to My Account
    And I click the Signin link
    When I enter <user_type> user details
    And I click the Signin submit button
    And I tap the Favourites Tab
    Then I see Favourited item
    And I tap Overview
    And I tap the Favourites preview
    When I tap one of the Favourited item
    Then I am on a Product Details Page
    And a PDP Page is loaded

Examples:
|user_type     |
|with_fav      |


@Fav
Scenario: It allow user to move item from Bag to Favourites
    Given I am on a Monogram PDP page
    And a PDP Page is loaded
    And I dismiss the build label
    And I click add to bag
    And I tap on notification bag icon
    When I tap Remove item link
    And I tap move to favourites
    And I tap the Favourites Tab
    Then I see Favourited item
    When I tap Bag
    Then I am shown Your bag is empty


@Fav
Scenario Outline: It displays previously Added Favourited SKU's
    Given I go to My Account
    And I click the Signin link
    And I enter <user_type> user details
    And I click the Signin submit button
    And I tap the Favourites Tab
    And I see Favourited item
    And I am on the Home page
    And I open the search slate
    When I search for a <item_type> item SKU
    And I am directed to that single PDP
    Then I see the icon shows as favourited

Examples:
|user_type     |item_type  |
|with_fav      |favourited |


@Fav
Scenario Outline: It clears the local storage of a user with favourited item
    Given I am on a PLP
    And I dismiss the build label
    And on mobile I can see a Detail View link
    And on mobile I click Detail View
    When I tap the Favourites CTA
    Then I see the icon shows as favourited
    And I click My Favourited icon
    And I tap the Favourites Tab
    And I click the Signin link
    And I enter <user_type> user details
    And I click the Signin submit button
    And I see Favourited item
    When I tap Remove item link
    Then I see message do you want to Remove
    And I tap Yes
    And I tap Overview
    And I Sign out
    And I click the Signin link
    And I enter <user_type> user details
    And I click the Signin submit button
    When I tap the Favourites Tab
    Then I am shown You have no favourites

Examples:
|user_type    |
|no_fav       |


@Fav
Scenario: It allows items to be removed from Favourited list
    Given I am on a Product Details Page
    And a PDP Page is loaded
    And I refresh the page
    And I dismiss the build label
    And I tap the Favourite icon on PDP page
    And MyAccount shows as Favourites momentarily
    And I see the icon shows as favourited
    When I click My Favourited icon
    And I tap the Favourites Tab
    And I tap Remove item link
    And I see message do you want to Remove
    And I tap Yes
    Then I see no Favourited items


@Fav
Scenario: Favourites do not clear on refresh
    Given I am on a PLP
    And I dismiss the build label
    And on mobile I can see a Detail View link
    And on mobile I click Detail View
    When I tap the Favourites CTA
    Then I see the icon shows as favourited
    When I refresh the page
    Then I see the icon shows as favourited


@pending
Scenario: It allow Guest user to Checkout on favourited items
    Given I am on a Product Details Page
    And I dismiss the build label
    And I tap the Favourite icon on PDP page
    And MyAccount shows as Favourites momentarily
    And I select a size 14
    And I tap on Add to Bag
    And the Checkout button appears
    And I Proceed to Checkout
    And I enter a guest email address
    And I select Saturday Shipping
    And I add a valid UK shipping address
    When I enter my card in Payment Details
    And I click Order
    Then the Order Confirmation is displayed
    And I can return to the original PDP from Checkout

@pending
Scenario: It allow return user to Checkout on favourited items
    Given I am on a Product Details Page
    And I dismiss the build label
    And I tap the Favourite icon on PDP page
    And MyAccount shows as Favourites momentarily
    And I select a size 14
    And I tap on Add to Bag
    And the Checkout button appears
    And I Proceed to Checkout
    And I enter a registered email address
    When I enter my card in Payment Details
    And I click Order
    Then the Order Confirmation is displayed
    And I can return to the original PDP from Checkout
    And I go to My Account
    When I tap the Favourites Tab
    Then I see the Favourites item
    And Share favourites panel is available
    When I tap Share favourites button
    Then I see the Share favourites slate

