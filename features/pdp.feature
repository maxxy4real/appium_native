Feature: PDP
  Background: Clear Session
    Given I clear the local storage
    And I am on the Home page
    And I dismiss the build label
    And I dismiss the cookie label

  @pdp
  Scenario: displays the correct product information
    Given I am on a non-sale Product Details Page
    And I dismiss the build label
    Then the product name is displayed
    And the product image carousel is displayed
    And the product price and number are displayed
    And the product colour is displayed
    And the size selector is displayed
    And the product description is displayed
    And the sharing cell is displayed
    And up to 4 recommended products are displayed with name and price
    And the features and care section is displayed
    And the shipping and returns CTA is displayed

  @pdp
  Scenario: Description and shipping info
    Given I am on a Product Details Page
    And I dismiss the build label
    And the product description is displayed
    And the shipping and returns CTA is displayed
    When I tap the shipping and returns CTA
    Then shipping and returns CTA becomes active
    And description CTA becomes inactive
    And shipping and returns information is displayed
    When I tap the shipping and returns CTA
    Then shipping and returns information is displayed
    When I tap the description CTA
    Then the product description is displayed

  @pdp
  Scenario Outline: Shipping info suppressed on restricted items
    Given I am on a restricted Product Details Page
    And I am in <country>
    Then the restricted item warning is displayed
    And the shipping and returns CTA is not displayed

    Examples:
    |country        |
    |Qatar          |
    |Canada         |

  @pdp
  Scenario: allows interaction with images in the Carousel
    Given I am on a Product Details Page
    And I dismiss the build label
    When I click on the first product image
    Then a larger version of the image is displayed
    When I click the close image icon
    Then the product image carousel is displayed

  @pdp @xsim
  Scenario: allows scrolling the Carousel
    Given I am on a Product Details Page
    And I dismiss the build label
    And images are displayed in the carousel
    When I drag across the carousel
    Then more images appear

  @pdp
  Scenario: allows interacting with the ‘You may also like’ section
    Given I am on a Product Details Page
    And I dismiss the build label
    Then up to 4 recommended products are displayed with name and price
    When I click on the first recommended product
    Then I am on the PDP for that item

#  @pdp
#  Scenario: plays videos from the Carousel
#    Given I am on a Product Details Page
#    Given there is a video
#    When I click on the video
#    Then the video plays

  @pdp
  Scenario: Shopping in Rest Of World
    Given I am on a Product Details Page
    And I dismiss the build label
    And I am in Rest of the World
    Then the Add To Bag CTA is not displayed
    And the size selector is not displayed
    And the Contact Us CTA is displayed
    When I tap the Contact Us CTA
    Then I am taken to the Customer Services page

  @pdp @pending
  Scenario: displays the sale price for items on sale
    Given I am on a sale Product Details Page
    And I dismiss the build label
    Then the original price has a strikethrough
    And the sale price is visible

  @pdp
  Scenario: displays other colours
    Given I am on a multicolour Product Details Page
    And I dismiss the build label
    And the product colour is displayed
    And there is more than one colour available
    When I tap on the product colour
    Then the colour carousel is displayed
    And the current selection is highlighted

  @pdp
  Scenario: allows changing colour
    Given I am on a multicolour Product Details Page
    And I dismiss the build label
    And the product colour is displayed
    And there is more than one colour available
    When I tap on the product colour
    Then the colour carousel is displayed
    When I tap a different colour
    Then the correct PDP loads

  @pdp
  Scenario: does not expand when there is only 1 colour
    Given I am on a single-colour Product Details Page
    And I dismiss the build label
    And the product colour is displayed
    And there is one colour available
    When I tap on the product colour
    Then the colour carousel is not displayed

  @pdp
  Scenario: allows selecting a size
    Given I am on a sized Product Details Page
    And I dismiss the build label
    And the size selector is displayed
    When I select a size
    Then the size is selected
    And the Add To Bag CTA is displayed

  @pdp
  Scenario: allows adding up to 5 of the same item
    Given I am on a sized Product Details Page
    And I dismiss the build label
    And the size selector is displayed
    When I select a size
    And I click add to bag
    Then the view bag CTA is displayed
    And I see '1 added to your bag'
    When I tap the add another CTA
    Then I see '2 added to your bag'
    When I tap add another 3 more times
    Then a warning tells me I can't add any more
    And the Add To Bag CTA is not displayed
    And the bag icon displays 5 items

  @pdp
  Scenario: allows adding different sizes
    Given I am on a sized Product Details Page
    And I dismiss the build label
    And the size selector is displayed
    When I select a size
    And I click add to bag
    And I tap the add another CTA
    And I tap add another 3 more times
    Then a warning tells me I can't add any more
    When I select a different size
    Then the Add To Bag CTA is displayed
    When I click add to bag
    And the bag icon displays 6 items
    #When I clear the local storage

  @pdp
  Scenario: does not allow selecting out of stock items
    Given I am on a size-out-of-stock Product Details Page
    And I dismiss the build label
    And the size selector is displayed
    And the item has a size out of stock
    When I select a size
    Then the size is selected
    And I click add to bag
    And I select an out of stock size
    Then the size is not changed