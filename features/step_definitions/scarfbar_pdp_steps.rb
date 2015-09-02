Then /^monogramming cell is displayed$/ do
  @wait.until {@scarfbar_pdp.monogrammingCell_element.exists?}
  $general.scroll(@scarfbar_pdp.monogrammingCell_element)
  assert @scarfbar_pdp.monogrammingCell_element.visible?, 'Monogramming cell is not visible'
end

Then /^storytelling cell is displayed$/ do
  @wait.until {@scarfbar_pdp.storytellingCell_element.exists?}
  $general.scroll(@scarfbar_pdp.storytellingCell_element)
  assert @scarfbar_pdp.storytellingCell_element.visible?, 'Storytelling cell is not visible'
end

Then /^PLP cell is displayed$/ do
  @wait.until {@scarfbar_pdp.plpCell_element.exists?}
  $general.scroll(@scarfbar_pdp.plpCell_element)
  assert @scarfbar_pdp.plpCell_element.visible?, 'PLP cell is not visible'
end

When /^I swipe left on the image carousel$/ do
  $general.scrollRight('.js-carousel-container', 300)
end

When /^I swipe right on the image carousel$/ do
  $general.scrollLeft('.js-carousel-container', 300)
end

When /^I swipe to the end of the carousel$/ do
  $general.scrollRight('.js-carousel-container', 1000)
end

Then /^the carousel does not move$/ do
  assert @pdp.visibleImages==@images, 'different images are displayed'
end

Then /^I see the previous images$/ do
  newImages = @pdp.visibleImages
  assert newImages!=@images, 'Visible images did not change'
  assert newImages.first<@images.first && newImages.last<@images.last, 'First and last images were not further to the left than original images'
end

When /^I swipe left on the image$/ do
  $general.scrollRight('.js-fullscreen-content img', 500)
end

Then /^I see a new image$/ do
  assert @zoomedImage!=@pdp.fullscreenImage_element.attribute('src')
end

When /^I swipe on the colour picker$/ do
  $general.scrollRight('.fake-element-path', 300)
end

Then /^colours are displayed in the carousel$/ do
  @visibleColours==@scarfbar_pdp.visibleColours
end

Then /^I can see more colours$/ do
  newColours = @scarfbar_pdp.visibleColours
  assert newColours!=@visibleColours, 'Visible Colours did not change'
  assert newColours.first<@visibleColours.first && newImages.last<@visibleColours.last, 'First and last colours were not further along than original images'
end

When /^I tap the selected colour$/ do
  @scarfbar_pdp.selectedColour_element.click
end

Then /^the page does not reload and the same product is displayed$/ do
  @wait.until {@pdp.itemNumber_element.exists?}
  $general.scroll(@pdp.itemNumber_element)
  assert @pdp.itemNumber_element.text.include?("#{@products.css("#{@type} sku").text}"), "Product Number does not match #{@products.css("#{@type} sku").text}"
end
