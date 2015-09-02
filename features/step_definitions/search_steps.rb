# Encoding: utf-8

Given /^I open the search slate$/ do
  sleep 1
  @search.searchBtn_element.when_visible.click
  @search.input_element.when_visible.focus
  sleep 1
end

Given /^I close the search slate$/ do
  @search.cancel_element.when_visible.click
  sleep 1
end

When /^I tap on search$/ do
  @search.searchBtn_element.when_visible.click
end

Given /^the search cta is visible in the taxonomy cell$/ do
  @search.taxonomy_cta_element.scroll_into_view
  sleep 1
end

When /^I tap the taxonomy search cta$/ do
  @search.searchBtn
  sleep 1
end

Then /^the search slate opens$/ do
  @search.input_element.when_visible.focus
end

Given /^I search for "(.*?)"$/ do |term|
  @term = term
  @search.input = @term
  @search.input_element.send_keys :return
  sleep 2
end

Then /^the product range search term is displayed$/ do
  @search.update_element.when_visible.focus
  assert_equal @search.update_element.text, 'Bags', 'terms do not match'
end

Then /^the total number of products is displayed$/ do
  @search.count_element.when_visible
end

Then /^the valid term is displayed in Recent searches$/ do
  @search.recentSearchTerms_element.when_visible.focus
  assert @search.recentSearchTerms.include?(@term), 'cannot find recent Search term'
end

Then /^the nonexistent term is not displayed in Recent searches$/ do
  if @search.recentSearchTerms?
  assert !@search.recentSearchTerms.include?(@term), 'Non existent term should not be stored'
  end
end

Given /^the no result message is displayed$/ do
  @search.noResult_element.when_visible.focus
end

When /^I tap the detail_view$/ do
  @search.view_element.when_visible.click
  sleep 1
  @search.detail_element.when_visible.click
  @search.facet_status_element.when_visible.focus
  @search.detail_view_element.when_visible.focus
  @plp.description_element.scroll_into_view
end

And /^I click the Detail View$/ do
  @search.view_element.when_visible.click
  sleep 1
  @search.detail_element.when_visible.click
  sleep 1
  @search.facet_status_element.when_visible.focus
  @search.detail_view_element.when_visible.focus
end


Then /^the search results load in List View$/ do
  if @search.facet_arrow_element.visible?
    @search.facet_arrow
    sleep 1
  end
  @wait.until {@search.view_element.visible?}
  @search.view_element.click
  @wait.until {@search.list_view_tick_element.visible?}
  sleep 1
  @common.closeSlate
  sleep 1
end

When /^I click the View facet$/ do
  if @search.facet_arrow_element.visible?
    @search.facet_arrow
    sleep 1
  end
  @wait.until {@search.view_element.visible?}
  @search.view_element.click
end

Then /^I click Gallery$/ do
  @wait.until {@search.gallery_element.visible?}
  sleep 1
  @search.gallery_element.click
end

Then /^the auto corrected valid term is displayed$/ do
  assert @search.update?, 'Cannot see Search term displayed' 
  @term = @search.update_element.text
end

Then /^I tap the search term$/ do
  @search.update
end

Then /^the search field is visible at the top of the navigation menu$/ do
  @search.cta_element.when_visible.focus
end

Given /^I have recent search terms$/ do
  #assert @search.recentSearchTerm.count > 0, 'cant find recent terms'
  @search.input = "shoes"
  @search.input_element.send_keys :return
  sleep 2
  @homepage.leftTrayIcon_element.when_visible.click
  sleep 1
  @search.cta
  sleep 3
  @search.recentSearchTerm_element.when_visible.focus
  assert_operator @search.recentSearchTerm.size, :> , 0, 'cant find recent terms'
  $recent_term = @search.recentSearchTerm_element.text
end

Given /^I re\-enter a recent search term$/ do
  @search.input = $recent_term
  @search.input_element.send_keys :return
  sleep 2
end

Then /^the re\-entered term is at the top of Recent searches$/ do
  puts @search.recentSearchTerm
  #assert @search.recentSearchTerm_element.text = $recent_term, 'terms dont match'
end

And /^Searching for a product range of more than 20 products$/ do
  @search.input = "bag"
  @search.input_element.send_keys :return
  sleep 1
end

Then /^I return to the same point on the PLP$/ do
  sleep 1
  @wait.until {@plp.item_by_position(@pos).visible?}
end

And /^I look for an item with special character$/ do
  puts 'pitón'
  @search.input = 'pitón'
  @search.input_element.send_keys :return
  sleep 2
end

When /^I look for an (.*?) that returns a single product$/ do |item|
  $item = item
  @search.input = $item
  @search.input_element.send_keys :return
  sleep 2
end

When /^I search for a (.+) item SKU$/ do |type|
  @term = @products.css("#{type} sku").text
  @search.input = "#{@products.css("#{type} sku").text}"
  @search.input_element.send_keys :return
end
