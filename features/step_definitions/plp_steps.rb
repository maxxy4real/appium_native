# Encoding: utf-8

Given /^I am on a PLP$/ do
  @plp.goto
  @wait.until {@homepage.logo_element.visible?}
  @wait.until {@plp.shelf_item_element.visible?}
  #used to get count of initially loaded products
  $plp_item_count = @browser.find_elements(:css, ".shelf-item").size
end

And /^on mobile I can see a Detail View link$/ do
  if $browser_type.include? 'mobile'
    @wait.until {@plp.detail_view_element.visible?}
  end
end

And /^on mobile I click Detail View$/ do
  if $browser_type.include? 'mobile'
    @plp.detail_view
    sleep 1
  end
end

Then /^a PLP loads$/ do
  @wait.until {@plp.shelf_item_element.visible?}
  #used to get count of initially loaded products
  $plp_item_count = @browser.find_elements(:css, ".shelf-item").size
end

Then /^I scroll to the bottom of the PLP page$/ do
  @plp.scroll(@plp.last_shelf_item_element)
end

Then /^more products are loaded$/ do
  @current_time = Time.now
  loop do
    @new_item_count = @browser.find_elements(:css, '.shelf-item').size
    break if @new_item_count > $plp_item_count || Time.now > @current_time + 10
  end
  assert @new_item_count > $plp_item_count, 'more products have not loaded'
end

And /^I tap item number ([0-9]+) in the shelf$/ do |pos|
  @pos = pos
  @wait.until {@plp.item_by_position(pos).exists?}
  @plp.scroll(@plp.item_by_position(pos))
  @wait.until {@plp.item_by_position(pos).visible?}
  @plp.item_cta(pos).click
  #sleep 2
end

Then /^20 products are initially loaded$/ do 
  @wait.until {@plp.shelf_item?}

  @item = @browser.find_elements(:css, '.shelf-item')
  assert_equal 20, @item.size, 'at least 20 should be loaded'
end

When /^I click on a Product image$/ do
  @plp.shelf_item_link
end

When /^I click Gallery View$/ do
  @plp.gallery_view
end

Then /^I can see a Gallery View link$/ do
  @wait.until {@plp.gallery_view_element.visible?}
end

Then /^I can see the product decription summary$/ do
  $general.scroll(@plp.description_element)
end

Then /^I can see product prices$/ do
  $general.scroll(@plp.price_element)
end

Then /^I can see product colour options$/ do
  $general.scroll(@plp.colours_element)
end

Then /^I cannot see the product decription summary$/ do
  $general.scroll(@plp.last_shelf_item_element)
  sleep 3
  assert !@plp.description_element.visible?
end

Then /^I cannot see product prices$/ do
  assert !@plp.price_element.visible?
end

Then /^I cannot see product colour options$/ do
  assert !@plp.colours_element.visible?
end

Then /^I see at least one product shelf$/ do
  @wait.until {@plp.shelf_element.visible?}
end

Given /^I see a View All cta$/ do
  $general.scroll(@plp.view_all_element)
  #used to check 'view all' links disappear after being clicked
  $view_all_count = @browser.find_elements(:css, ".shelf-loadmore a").size
end

When /^I click on View All$/ do
  @plp.view_all
  # sleep 3
end

Then /^I cannot see the View All cta anymore$/ do
  @new_count = @browser.find_elements(:css, ".shelf-loadmore a").size
  assert_operator @new_count, :<, $view_all_count, 'wrong number'
end

Given /^I click on the last Product in the shelf$/ do
  $general.scroll(@plp.last_shelf_item_element)
  $position = @plp.last_shelf_item_element.location
  @plp.last_shelf_item_link
end

Then /^I return to the same position on the PLP$/ do
  @wait.until {@plp.shelf_element.visible?}
  @new_position = @plp.last_shelf_item_element.location
  assert_equal @new_position, $position, 'returned position is wrong'
end


Then /^I can see listed product decriptions$/ do
  i = 1
  while (@plp.item_by_position(i).exists?) && (i < 8)
    @plp.scroll(@plp.item_description(i))
    assert(@plp.item_description(i).visible?, "Item number #{i} does not have a visible description")
    i+=1
  end
end

Then /^the listed product decriptions are no longer visible$/ do
  i = 1
  while (@plp.item_by_position(i).exists?) && (i < 8)
    @plp.scroll(@plp.item_description(i))
    assert(!@plp.item_description(i).visible?, "Item number #{i} does not have a visible description")
    i+=1
  end
end


