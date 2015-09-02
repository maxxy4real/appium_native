# Encoding: utf-8

Given /^I am on associate Login page$/ do
  @store_associate.goto
  sleep 2
  @homepage.logo_element.when_visible
end

And /^I click associate Signin button$/ do
  @store_associate.associateSigninLink_element.when_visible.click
  sleep 3
end

And /^I see Login Indicator displaying Associate Number$/ do
  @wait.until {@store_associate.associateIcon_element.visible?}
end

Then /^I see signout icon at the bottom of the view port$/ do
 @wait.until {@store_associate.signoutIcon_element.visible?}
end

And /^I click signout icon$/ do
  @store_associate.signoutIcon_element.when_visible.click
  sleep 1
end

Then /^I see signout dialog alert box$/ do
 #@wait.until {@store_associate.alertTitle_element.visible?}
 assert_equal "Sign out store associate?", @store_associate.alertTitle
end

And /^I click NO to close alert dialog box$/ do
  @store_associate.alertNo
  sleep 1
end

And /^I click YES to return to Sign In Page$/ do
  @store_associate.alertYes
  sleep 1
end

Then /^I see associate ID and store number$/ do
  sleep 3
  @wait.until {@store_associate.associateID_element.visible?}
  assert_equal "Associate ID: 35497", @store_associate.associateID
  assert_equal "Store number: 22334", @store_associate.storeNumber
end

Then /^the order associated with the ID should be removed$/ do
  sleep 3
  @wait.until {@checkout.viewOrderLink_element.visible?}
  assert !@store_associate.associateID?
end
