Feature: Verify that the PLP pages are displayed properly

Background: Clear Session
    Given Im Logged out of the app
    And I am on a PLP
    And I dismiss the build label
    And I dismiss the cookie label

@plp
Scenario: It displays products in shelves in the PLPs
    Then I see at least one product shelf

@plp
Scenario: It allows different Product images to link to PDPs
    When I click on a Product image
    Then a PDP Page is loaded

@plp @mobile
Scenario: It displays Alternate View links
    Then I can see a Gallery View link
    And on mobile I can see a Detail View link

@plp
Scenario: It displays products in Detail View
    When on mobile I click Detail View
    Then I can see the product decription summary
    And I can see product prices
    And I can see product colour options

@plp @mobile
Scenario: It displays products in Gallery View
    When I click Gallery View
    Then I cannot see the product decription summary
    And I cannot see product prices
    And I cannot see product colour options


@plp
Scenario: It allows Product shelves to be expanded
    And I see a View All cta
    When I click on View All
    Then more products are loaded
    And I cannot see the View All cta anymore

@plp
Scenario: It can navigate between PLP & PDP
    And I click on the last Product in the shelf
    And a PDP Page is loaded
    When I go back
    Then I return to the same position on the PLP

@plp
Scenario: It can navigate between expanded PLP & PDP
    And I see a View All cta
    And I click on View All
    And I click on the last Product in the shelf
    And a PDP Page is loaded
    When I go back
    Then I return to the same position on the PLP
