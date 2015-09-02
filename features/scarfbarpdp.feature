Feature: Scarf Bar PDP
  Background: Navigate to Scarf Bar PDP
    Given I am on a scarf-bar Product Details Page
    And I dismiss the build label

  @scarfpdp @pending
  Scenario: Components display correctly
    Then the product name is displayed
    And the product image carousel is displayed
    And the product price and number are displayed
    And the product colour is displayed
    And the Add To Bag CTA is displayed
    And the product description is displayed
    And monogramming cell is displayed
    And storytelling cell is displayed
    And the sharing cell is displayed
    And up to 4 recommended products are displayed with name and price
    And PLP cell is displayed

  @scarfpdp @pending
  Scenario: Viewing more images
    Given the product image carousel is displayed
    And images are displayed in the carousel
    When I swipe left on the image carousel
    Then more images appear
    When I swipe to the end of the carousel
    And I swipe left on the image carousel
    Then the carousel does not move
    When I swipe right on the image carousel
    Then I see the previous images

  @scarfpdp @pending
  Scenario: Zooming in on images
    Given the product image carousel is displayed
    And images are displayed in the carousel
    When I click on the first product image
    Then a larger version of the image is displayed
#    And a close CTA is displayed
#    When I pinch zoom in on the image
#    Then the image zooms in
#    When I swipe up/down/left/right on the image
#    Then I see a different part of the image
#    When I pinch zoom out on the image
#    Then the image goes back to original size
#    When I pinch zoom out on the image
#    Then the image size does not change
    When I click the close image icon
    Then the product image carousel is displayed

#  @scarfpdp @monogramming
#  Scenario: Can’t zoom on monogrammed image
#    Given I have added a monogram to an item
#    And the monogrammed hero image is displayed
#    When I tap the monogrammed hero image
#    Then a larger version of the image is displayed
#    When I pinch zoom on the image
#    Then the image is displayed the same size

  @scarfpdp @pending
  Scenario: Viewing more images when zoomed
    When I click on the first product image
    Then a larger version of the image is displayed
    When I swipe left on the image
    Then I see a new image
    When I click the close image icon
    Then the product image carousel is displayed

  @scarfpdp @pending
  Scenario: Changing item colour
    Given the product colour is displayed
    When I tap on the product colour
    Then the colour carousel is displayed
    And colours are displayed in the carousel
    When I swipe on the colour picker
    Then I can see more colours
    When I tap a different colour
    Then the correct PDP loads
    #And the product images are in the new colour
    And the colour carousel is displayed

  @scarfpdp @pending
  Scenario: Tapping selected colour
    Given the product colour is displayed
    When I tap the selected colour
    Then the page does not reload and the same product is displayed

  @scarfpdp @pending
  Scenario: Add to bag
    Given the Add To Bag CTA is displayed
    When I click add to bag
    Then the view bag CTA is displayed
    And the Add To Bag CTA is not displayed
    When I tap the view bag CTA
    Then the correct item is displayed

  @scarfpdp @pending
  Scenario: Add 5+ items to bag
    And I click add to bag
    Then the view bag CTA is displayed
    And I see '1 added to your bag'
    When I tap the add another CTA
    Then I see '2 added to your bag'
    When I tap add another 3 more times
    Then a warning tells me I can't add any more
    And the Add To Bag CTA is not displayed
    And the bag icon displays 5 items

#  @scarfpdp
#  Scenario: Item out of stock
#    Given the item is out of stock
#    Then the Add To Bag CTA is not displayed
#    And the out of stock warning is displayed

#  @scarfpdp
#  Scenario: Shopping in Rest Of World
#    Given I am in a non-shippable country
#    Then the Add To Bag CTA is not displayed
#    And the Contact Us CTA is displayed
#    When I tap the Contact Us CTA
#    Then I am taken to the Customer Services page

#  @scarfpdp
#  Scenario: Item on sale
#    Given the item is on sale
#    Then the original price is displayed beneath the sale price
#    When I tap the Add To Bag CTA
#    And I navigate to Bag
#    Then the item is displayed
#    And the price is correct

  @scarfpdp @pending
  Scenario: Description and shipping info
    Given the product description is displayed
    And the shipping and returns CTA is displayed
    When I tap the shipping and returns CTA
    Then shipping and returns CTA becomes active
    And description CTA becomes inactive
    And shipping and returns information is displayed
    When I tap the shipping and returns CTA
    Then shipping and returns information is displayed
    When I tap the description CTA
    Then the product description is displayed

#  @scarfpdp
#  Scenario: Opening and closing the Monogramming slate
#    Given the monogramming cell is displayed
#    When I tap the Add Monogram CTA
#    Then the monogramming slate is displayed
#    When I tap the close/submit CTA
#    Then the monogramming slate is not displayed
#    And the monogramming cell is displayed
#
#  @scarfpdp
#  Scenario: Adding a monogram
#    Given the monogramming slate is open
#    And I have selected my monogramming options
#    When I tap the Submit CTA
#    Then the monogramming slate is not displayed
#    And the transaction module is displayed
#    And the price has changed to include the monogramming price
#    And the selected initials are displayed
#    And the hero image is updated with the initials
#    And the monogramming image is updated with the initials
#    When I tap the Add To Bag CTA
#    Then the item is added to my bag with monogramming
#
#  @scarfpdp
#  Scenario: Remove Monogram
#    Given the monogramming slate is open
#    And I have selected my monogramming options
#    When I tap the Submit CTA
#    Then the Edit Your Monogram CTA is displayed
#    And the Remove monogram CTA is displayed
#    When I tap the Remove monogram CTA
#    Then the removal confirmation is displayed
#    When I press No
#    Then the monogramming cell is displayed
#    When I tap the Remove monogram CTA
#    And I press Yes
#    Then the transaction cell is displayed
#    And the product is no longer monogrammed
#
#  @scarfpdp
#  Scenario: Monogramming out of stock
#    Given the monogramming is out of stock
#    Then the Add Monogram CTA is not displayed
#    And the monogramming out of stock warning is displayed
#
#  @scarfpdp
#  Scenario: Storytelling content
#    Given the Storytelling cell is visible
#    When I tap the storytelling CTA
#    Then the storytelling CTA is replaced by a spinner
#    And the content loads onto the page
#    And the viewport is scrolled down so that the content is visible

  @scarfpdp @pending
  Scenario: Colour filter carried through to PDP
    Given I’m on Scarf Bar PLP
    And I have filtered the list by colour
    When I tap on an item
    Then I am on Scarf Bar PDP
    And the colour picker only displays filtered colours
    When I return to Scarf Bar PLP
    Then the colour filter is cleared