
# Encoding: utf-8
Then /^I am directed to that single PDP$/ do
  @wait.until {@homepage.logo_element.visible?}
  @wait.until {@pdp.itemNumber_element.exists?}
  $general.scroll(@pdp.itemNumber_element)
  assert @pdp.itemNumber.include?(@term), 'item numbers dont match'
end

Given /^I am on a Product Details Page$/ do
  @pdp.goto
  sleep 1
  @homepage.logo_element.when_visible
end

Given /^I am on a (.+) Product Details Page$/ do |type|
  @type = type
  @browser.get "#{BASE_URL}/#{@products.css("#{@type} url").text}"
  sleep 3
end

And /^a PDP Page is loaded$/ do
  @wait.until {@pdp.itemNumber?}
end

Then /^I can see product decriptions$/ do
  @wait.until {@pdp.description_element.exists?}
  $general.scroll(@pdp.description_element)
  @wait.until {@pdp.description.visible?}
end

Then /^the price is shown in Dollars$/ do
  @wait.until {@pdp.itemPrice?}
  assert @pdp.itemPrice.include?('$'), 'Price should include dollar sign'
end

Then /^I am still on the Page Details Page$/ do
  assert @browser.get_current_url.eql? @pdp.page_url
end

And /^I navigate to a PDP page from the Fragrances Page$/ do
  @menu.fragrancePLPlink
  sleep 2
  @Favourites.fragrancePDP
  sleep 2
end

Then /^the product name is displayed$/ do
  @wait.until {@pdp.itemName_element.exists?}
  $general.scroll(@pdp.itemName_element)
  assert @pdp.itemName_element.visible?, 'Product Name is not visible'
  assert @pdp.itemName_element.text.eql?("#{@products.css("#{@type} title").text}"), "Product name is not #{@products.css("#{@type} title").text}"
end

Then /^the product image carousel is displayed$/ do
  assert @pdp.carousel_element.visible?
end

Then /^the product price and number are displayed$/ do
  @wait.until {@pdp.itemNumber_element.exists?}
  $general.scroll(@pdp.itemNumber_element)
  assert @pdp.itemPrice_element.visible?, 'Product Price is not visible'
  assert @pdp.itemNumber_element.visible?, 'Product Number is not visible'
  assert @pdp.itemNumber_element.text.include?("#{@products.css("#{@type} sku").text}"), "Product Number does not match #{@products.css("#{@type} sku").text}"
end

Then /^the product colour is displayed$/ do
  @wait.until {@pdp.colourPicker_element.exists?}
  $general.scroll(@pdp.colourPicker_element)
  assert @pdp.colourPicker_element.visible?, 'colour picker is not visible'
  assert @pdp.colourName_element.text.downcase.eql?("#{@products.css("#{@type} colour").text}".downcase), "Colour is not #{@products.css("#{@type} colour").text}"
end

Then /^the size selector is displayed$/ do
  @wait.until {@pdp.size_cta_element.exists?}
  $general.scroll(@pdp.size_cta_element)
  assert @pdp.size_element.visible?, 'Size Selector is not visible'
end

Then /^the size selector is not displayed$/ do
  assert !@pdp.size_element.visible?, 'Size Selector is not visible'
end

Then /^the Add To Bag CTA is displayed$/ do
  @wait.until {@pdp.add_to_bag_element.exists?}
  $general.scroll(@pdp.add_to_bag_element)
  assert @pdp.add_to_bag_element.visible?, 'Add to bag CTA not visible'
end

Then /^the Add To Bag CTA is not displayed$/ do
  @wait.until {!@pdp.add_to_bag_element.visible?}
end

Then /^the product description is displayed$/ do
  @wait.until {@pdp.description_element.exists?}
  $general.scroll(@pdp.description_element)
  assert @pdp.description_element.visible?, 'Description is not visible'
end

Then /^the sharing cell is displayed$/ do
  @wait.until {@pdp.sharingCell_element.exists?}
  $general.scroll(@pdp.sharingCell_element)
  assert @pdp.sharingCell_element.visible?, 'Sharing Cell is not visible'
end

Then /^up to 4 recommended products are displayed with name and price$/ do
  $general.scroll(@pdp.recommendedItems_element)
  recs=0
  while @pdp.recommendedItem(recs+1).exists?
    recs+=1
  end
  assert recs>=1, 'No recommendations'
  assert recs<=4, 'More than 4 recommendations'
  for i in 1..recs
    $general.scroll(@pdp.recommendedItemPrice(i))
    assert @pdp.recommendedItemName(i).text.size>0, "Item number #{i} does not have a name"
    assert @pdp.recommendedItemPrice(i).text.size>0, "Item number #{i} does not have a price"
  end
end

Then /^the features and care section is displayed$/ do
  @wait.until {@pdp.features_element.exists?}
  $general.scroll(@pdp.features_element)
  assert @pdp.features_element.visible?, 'Features and care section not visible'
end

Then /^the shipping and returns CTA is displayed$/ do
  @wait.until {@pdp.shippingTabCTA_element.exists?}
  $general.scroll(@pdp.shippingTabCTA_element)
  assert @pdp.shippingTabCTA_element.visible?, 'Shipping and Returns tab is not visible'
end

Then /^the restricted item warning is displayed$/ do
  @wait.until {@pdp.shippingRestrictions_element.exists?}
  $general.scroll(@pdp.shippingRestrictions_element)
  assert @pdp.shippingRestrictions_element.visible?, 'Shipping restrictions warning is not visible'
end

Then /^the shipping and returns CTA is not displayed$/ do
  assert !@pdp.shippingTabCTA_element.exists?, 'The shipping and returns CTA is still on the page'
end

When /^I tap the shipping and returns CTA$/ do
  @pdp.shippingTabCTA
end

When /^I tap the description CTA$/ do
  @pdp.descriptionTabCTA
end

Then /^shipping and returns CTA becomes active$/ do
  assert @pdp.shippingTabCTA_element.attribute('class').include?('tabs-nav-item-active'), "Shipping and returns tab is not active"
end

Then /^shipping and returns CTA becomes inactive$/ do
  assert !@pdp.shippingTabCTA_element.attribute('class').include?('tabs-nav-item-active'), "Shipping and returns tab is active"
end

Then /^description CTA becomes active$/ do
  assert @pdp.descriptionTabCTA_element.attribute('class').include?('tabs-nav-item-active'), "Description tab is not active"
end

Then /^description CTA becomes inactive$/ do
  assert !@pdp.descriptionTabCTA_element.attribute('class').include?('tabs-nav-item-active'), "Description tab is active"
end

Then /^shipping and returns information is displayed$/ do
  assert @pdp.shippingInfo_element.visible?, 'Shipping and returns information is not displayed'
end

When /^I click on the first product image$/ do
  @pdp.carouselImage(1).click
end

Then /^a larger version of the image is displayed$/ do
  @wait.until {@pdp.fullscreenImage_element.visible?}
  @zoomedImage=@pdp.fullscreenImage_element.attribute('src')
end

When /^I click the close image icon$/ do
  @pdp.closeImage
end

Given /^images are displayed in the carousel$/ do
  @wait.until {@pdp.carousel_element.visible?}
  @images = @pdp.visibleImages
end

When /^I drag across the carousel$/ do
  if $browser_type.eql? 'touch'
    element = @browser.find_element(:css, '.js-carousel-track')
  else
    element = @browser.find_element(:css, '.js-carousel-container')
  end
  $general.scrollRight(element, (@pdp.carousel_element.size.width/3)*2)
  sleep 1
end

Then /^more images appear$/ do
  newImages = @pdp.visibleImages
  assert newImages!=@images, 'Visible images did not change'
  assert newImages.first>@images.first && newImages.last>@images.last, 'First and last images were not further along than original images'
end

When /^I click on the first recommended product$/ do
  $general.scroll(@pdp.recommendedItemName(1))
  @itemName=@pdp.recommendedItemName(1).text
  @pdp.recommendedItem(1).click
  sleep 1
end

Then /^I am on the PDP for that item$/ do
  @wait.until {@pdp.itemName_element.visible?}
  assert @pdp.itemName_element.text.eql?(@itemName), "Item clicked was '#{@itemName}', but on '#{@pdp.itemName_element.text}' PDP"
end

Then /^there is more than one colour available$/ do
  assert @pdp.moreColours_element.exists?, 'There are not multiple colours'
  @colours=@pdp.moreColours_element.text.sub('(','').split(" ")[0].to_i+1
end

Then /^there is one colour available$/ do
  assert !@pdp.moreColours_element.exists?, 'There are multiple colours available'
end

When /^I tap on the product colour$/ do
  @pdp.colourCTA_element.click
end

Then /^the colour carousel is displayed$/ do
  $general.scroll(@pdp.colourCarousel_element)
  for i in 1..@colours
    assert @pdp.colourCarouselItem(i).visible?, "Colour #{i} is not visible"
  end
  assert !@pdp.colourCarouselItem(@colours+1).visible?, 'Too many colours displayed'
end

Then /^the colour carousel is not displayed$/ do
  assert !@pdp.colourCarousel_element.visible?, 'The colour carousel is displayed'
end

Then /^the current selection is highlighted$/ do
  assert @pdp.selectedColour_element.attribute('href').include?("#{@products.css("#{@type} sku").text}"), 'Wrong colour is selected'
end

#Checks whether the first colour is selected. If not it is clicked, if it is then second colour is clicked.
When /^I tap a different colour$/ do
  if !@pdp.colourCarouselItem(1).attribute('class').include?('selected')
    @newColourLink = @pdp.colourItemLink(1).attribute('href')
    #Clicking colourItemLink is blocked by colourCarouselItem in most browsers, but clicking colourCarouselItem in iOS doesn't do anything
    if @browser.capabilities.browser_name == 'Safari' || @browser.capabilities.browser_name == 'safari' || @browser.capabilities.browser_name == 'iOS'
      @pdp.colourItemLink(1).click
    else
      @pdp.colourCarouselItem(1).click
    end
  else
    @newColourLink = @pdp.colourItemLink(2).attribute('href')
    #Clicking colourItemLink is blocked by colourCarouselItem in most browsers, but clicking colourCarouselItem in iOS doesn't do anything
    if @browser.capabilities.browser_name == 'Safari' || @browser.capabilities.browser_name == 'safari' || @browser.capabilities.browser_name == 'iOS'
      @pdp.colourItemLink(2).click
    else
      @pdp.colourCarouselItem(2).click
    end
  end
end

Then /^the correct PDP loads$/ do
  @wait.until {@pdp.itemName_element.visible?}
  @browser.current_url.include?("#{@newColourLink}")
end

When /^I select a size$/ do
  i=2
  while @pdp.sizeOption(i).exists?
    if !@pdp.sizeOption(i).attribute("disabled")
      @selected = @pdp.sizeOption(i).text
      break
    else
      i+=1
    end
  end
  @pdp.size_cta=@selected
end

When /^I select a different size$/ do
  i=2
  while @pdp.sizeOption(i).exists?
    if !@pdp.sizeOption(i).attribute("disabled") && !@pdp.sizeOption(i).attribute("selected")
      @selected = @pdp.sizeOption(i).text
      break
    else
      i+=1
    end
  end
  @pdp.size_cta=@selected
end

Given /^the item has a size out of stock$/ do
  outOfStock=false
  inStock=false
  i=2
  while @pdp.sizeOption(i).exists?
    if @pdp.sizeOption(i).attribute("disabled")
      outOfStock=true
    else
      inStock=true
    end
    i+=1
  end
  assert outOfStock==true, 'This item has no sizes out of stock'
  assert inStock==true, 'This item has no sizes in stock'
end

When /^I select an out of stock size$/ do
  i=2
  while @pdp.sizeOption(i).exists?
    if @pdp.sizeOption(i).attribute("disabled")
      outOfStock = @pdp.sizeOption(i).text
      break
    else
      i+=1
    end
  end
  @pdp.size_cta=outOfStock
end

Then /^the size is selected$/ do
  assert @pdp.size_cta.eql?(@selected), 'Size is not selected'
end

Then /^the size is not changed$/ do
  assert @pdp.size_cta.eql?(@selected), "Selected size has not remained the same. Expexted #{@selected} but got #{@pdp.size_cta}"
end

Then /^the view bag CTA is displayed$/ do
  @wait.until {@pdp.viewBag_element.visible?}
end

Then /^I see '([0-9]+) added to your bag'$/ do |num|
  @wait.until {@pdp.bagMessage_element.exists?}
  @pdp.scroll(@pdp.bagMessage_element)
  assert @pdp.bagMessage_element.text.include?(num), "Message reads '#{@pdp.bagMessage_element.text}'"
end

When /^I tap the add another CTA$/ do
  @wait.until {@pdp.addAnotherCTA_element.exists?}
  @pdp.scroll(@pdp.addAnotherCTA_element)
  @pdp.addAnotherCTA
end

When /^I tap add another ([0-9]+) more times$/ do |num|
  (1..num.to_i).each do
    @wait.until {@pdp.addAnotherCTA_element.exists?}
    $general.scroll(@pdp.addAnotherCTA_element)
    @pdp.addAnotherCTA
    @wait.until {@pdp.viewBag_element.visible?}
  end
end

Then /^a warning tells me I can't add any more$/ do
  @wait.until {@pdp.bagMessage_element.visible?}
  $general.scroll(@pdp.bagMessage_element)
  assert @pdp.bagMessage_element.text.include?("This is the total number of items allowed. Please select a different size or checkout."), "Message is not correct. Actual message was #{@pdp.bagMessage_element.text}"
end

Then /^the bag icon displays ([0-9]+) items$/ do |num|
  assert @pdp.bagNotification_element.text.eql?(num)
end

When /^I tap the view bag CTA$/ do
  @pdp.viewBag
end

Then /^the Contact Us CTA is displayed$/ do
  @wait.until {@pdp.contactUsCTA_element.exists?}
  @pdp.scroll(@pdp.contactUsCTA_element)
  assert @pdp.contactUsCTA_element.visible?, 'Contact us CTA is not visible'
end

When /^I tap the Contact Us CTA$/ do
  @pdp.contactUsCTA
end

Then /^I am taken to the Customer Services page$/ do
  @wait.until {@customer_services.header_element.visible?}
end