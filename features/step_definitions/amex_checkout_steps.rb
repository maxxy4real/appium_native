Then /^I see Amex payment option$/ do
  @wait.until {@amex_checkout.amexBtn?}
end

Then /^I should not see Amex payment option$/ do
  @wait.until {!@amex_checkout.amexBtn?}
end

And /^I tap Amex EXPRESS checkout$/ do
  @wait.until {@amex_checkout.amexBtn_element.visible?}
  sleep 1
  @amex_checkout.amexBtn
  sleep 3
end

Then /^I should be directed to Amex EXPRESS checkout page$/ do
  @wait.until {@browser.window_handles.size > 1}
  @browser.switch_to.window @browser.window_handles.last
  sleep 1
end

And /^I enter amex_user card details$/ do
  @amex_checkout.amexUserID = @cards.css('Amex userid').text
  @amex_checkout.amexPswdfield = @cards.css('Amex psw').text
  @amex_checkout.nextBtn_element.when_visible.click
  sleep 4
  if @amex_checkout.amexCardType_element.visible?
     @amex_checkout.amexCardType  
     sleep 1
  end  
  @amex_checkout.cidPinBox = @cards.css('Amex CID').text
  @amex_checkout.nextBtn
  sleep 1
end

And /^I enter incomplete amex_user details$/ do
  @amex_checkout.amexUserID = @cards.css('IncompleteAmex userid').text
  @amex_checkout.amexPswdfield = @cards.css('Amex psw').text
  @amex_checkout.nextBtn_element.when_visible.click
  sleep 5
  if @amex_checkout.amexCardType_element.visible?
     @amex_checkout.amexCardType 
     sleep 2 
  end  
  @amex_checkout.cidPinBox = @cards.css('Amex CID').text
  sleep 1
  @amex_checkout.nextBtn
end

And /^I should be brought back into the mobile app$/ do
  @browser.switch_to.window @browser.window_handles.first
  puts @browser.title
  sleep 5
   if @wait.until {@signup.titleDrpDown?}
      @signup.titleDrpDown = @new_users.css('USUser title').text
      sleep 1
      @change_country.doneCTA
   end
end

And /^I see that Amex Billing address does not overwrite shipping address$/ do
  @wait.until {@amex_checkout.shipp_address_element.visible?}
  @shipping_address = @amex_checkout.shipp_address
  @wait.until {@amex_checkout.bill_address_element.visible?}
  @billing_address = @amex_checkout.bill_address
  assert_not_equal("#{@shipping_address}", "#{@billing_address}")
end

And /^I see that the shipping address is the billing address return from AMEX EXPRESS checkout$/ do
  @wait.until {@amex_checkout.shipp_address_element.visible?}
  @shipping_address = @amex_checkout.shipp_address
  @wait.until {@amex_checkout.bill_address_element.visible?}
  @billing_address = @amex_checkout.bill_address
  assert_equal("#{@shipping_address}", "#{@billing_address}")
end

And /^I click continue button on the checkout slate$/ do
  @amex_checkout.DoneBtn
end

And /^I select option to save amex card details$/ do
  sleep 2
  @amex_checkout.check_saveCard
end

Given /^I used my saved card details$/ do
  @checkout.known_cardCvv = @cards.css('Amex CID').text
  #Have to click outside the field to remove prompt warning. Otherwise clicking Checkout will fail
  $browser.find_element(:css, '.js-payment-step .js-notification').click
end

And /^I Cancel Amex Express checkout$/ do
  @wait.until {@amex_checkout.CancelBtn?}
  @amex_checkout.CancelBtn
  sleep 3
  @browser.switch_to.window @browser.window_handles.last
  sleep 1
end

And /^I enter title on the address slate$/ do
  @wait.until {@signup.titleDrpDown?}
  @signup.titleDrpDown = @new_users.css('USUser title').text
  sleep 1
  @change_country.doneCTA
  #Selenium::WebDriver::Support::Select.new(@browser.find_element(:name, "title")).select_by(:text, "Mrs")
  sleep 3
end