# Encoding: utf-8

Given /^I am on the Bag page$/ do
  @bag.goto
  @wait.until {@account.header_element.exists?}
  if @homepage.build_label?
    @homepage.build_label
    sleep 1
  end
end

When /^I tap Bag$/ do
  sleep 1
  @bag.icon
end

And /^I am shown Your bag is empty$/ do
  @bag.no_bag_element.when_visible
end

And /^I click add to bag$/ do
  $general.scroll(@pdp.add_to_bag_element)
  sleep 1
  @itemNumber==@pdp.itemNumber_element.text
  @pdp.add_to_bag
  sleep 3
end

Then /^I can see the bag notification$/ do
  @wait.until {@bag.icon_element.visible?}
end



Then /^there are items in my bag$/ do
  # sleep 2
  @wait.until {@bag.icon_element.exists?}
  if @bag.icon_element.visible?
  	@bag.icon
  end
  @wait.until {@bag.item_element.visible?}
  #because .size does not work with POM elements and will soon be deprecated. Note find_elementS returns an array which can then be counted
  @bag_item_count = @browser.find_elements(:css, '.js-bag-content li.card').size
  assert_operator @bag_item_count, :>=, 1 , 'cannot find bag items in bag'
end

Given /^there are no items in my bag$/ do
  #because .size does not work with POM elements
  @bag_item_count = @browser.find_elements(:css, '.js-bag-content li.card').size
  assert_operator @bag_item_count, :==, 0 , 'number of bag items should be zero'
end

Then /^the Empty bag message is displayed$/ do
  @wait.until {@bag.no_bag_element.visible?}
end

Then /^the Shop module is displayed$/ do
  @bag.shop_module_element.visible?
end

When /^I remove all items from my bag$/ do
  @item_count = @browser.find_elements(:css, '.js-bag-content li.card').size
  loop do
    @wait.until {@bag.remove_element.visible?}
    @bag.remove
    # sleep needed to allow for transtion
    @wait.until {@bag.yes_alert_element.visible?}
    sleep 1
    @bag.yes_alert
    @wait.until {@bag.no_bag_element.visible? || @browser.find_elements(:css, '.js-bag-content li.card').size < @item_count}
    sleep 2
    break if @bag.no_bag_element.visible? 
  end
end

When /^I tap edit on a bag item$/ do
  @wait.until {@bag.bag_total_element.visible?}
  $bag_total = @bag.bag_total.gsub(/\D/, '').to_i

  @wait.until {@bag.edit_element.visible?}
  @bag.edit
end

When /^I update the quantity of the item$/ do
  @wait.until {@bag.edit_quantity?}
  $initial_quanity = @bag.edit_quantity
  if $initial_quanity == '1'
    @bag.edit_quantity='2'
  else 
    @bag.edit_quantity='1'
  end
end

Then /^I can see the updated quantity in my bag$/ do
  @wait.until {@bag.quantity_element.visible?}
  @new_quantity = @bag.quantity.gsub(/\D/, '')
  assert_operator @new_quantity, :!=, $initial_quanity, 'values should not match'
end

Then /^I can see the updated order total in my bag$/ do
  @new_bag_total = @bag.bag_total.gsub(/\D/, '').to_i

  assert_operator @new_bag_total, :!=, $bag_total, 'values should not match'
end

Then /^Order summary information is correct$/ do
assert @bag.bag_total?, 'Cannot find Estimated Total field'
assert @checkout.cta?, 'Cannot find Checkout CTA'
# sleep 5
end

Then /^the payment and security modules are displayed$/ do
 @bag.scroll(@bag.payment_module_element)
end

Then /^I have multiple items in my Bag$/ do
  if @bag.icon_element.visible?
    @bag.icon
  end
  @wait.until {@bag.item_element.visible?}
  #because .size does not work with POM elements and will soon be deprecated. Note find_elementS returns an array which can then be counted
  @bag_item_count = @browser.find_elements(:css, '.js-bag-content li.card').size
  assert_operator @bag_item_count, :>=, 2 , 'cannot find bag items in bag'
end

Then /^the correct item is displayed$/ do
  assert @bag.item_info.include?(@itemNumber), 'Item number does not match'
end

Given /^the current bag currency is (.*?)$/ do |currency|
  @currency = currency
  @price = @bag.item_price_element.text
  assert @price.include?(@currency)
end

Given /^I add more of the same product until I reach the maximum of (.*?)$/ do |number|
  @wait.until {@bag.indicator_element.visible?}
  loop do
    @wait.until {@pdp.add_another?}
    @pdp.scroll(@pdp.add_another_element)
    @pdp.add_another
    @wait.until{@pdp.view_bag_element}
    sleep 2
    break if @bag.indicator == number
   end 
end

Then /^I can see a notification message for max number of a items$/ do
  @wait.until {@pdp.max_items?}
  @pdp.scroll(@pdp.max_items_element)
end

When /^I tap a product title in my bag$/ do
  @wait.until {@bag.item_link_element.visible?}
  @bag.item_link
end
