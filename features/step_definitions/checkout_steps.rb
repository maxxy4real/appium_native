# Encoding: utf-8

Then /^I am redirected to the Checkout page$/ do
  @wait.until {@checkout.email_element.visible?}
end

Then /^a failed checkout error message is displayed$/ do
  @wait.until {@common.error_element.visible?}
end

Given /^I add a (.*?) item to my bag$/ do |product|
  @product = product
  @wait.until {@search.searchBtn_element.visible?}
  sleep 1
  @search.searchBtn
  @wait.until {@search.input_element.visible?}

  case product
    when 'sized'
      @search.input = @products.css('sized sku').text
      @search.input_element.send_keys :return
      @wait.until {@pdp.title_bar_element.visible?}
      $general.scroll(@pdp.size_cta_element)
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
    when 'beauty'
      @search.input = @products.css('beauty sku').text
      @search.input_element.send_keys :return
      sleep 2
      @wait.until {@pdp.title_bar_element.visible?}
      $general.scroll(@pdp.add_to_bag_element)
    when 'mono'
      @search.input = @products.css('mono sku').text
      @search.input_element.send_keys :return
      sleep 2
      @wait.until {@pdp.title_bar_element.visible?}
      $general.scroll(@pdp.add_to_bag_element)
    when 'restricted'
      @search.input = @products.css('restricted sku').text
      @search.input_element.send_keys :return
      sleep 2
      @wait.until {@pdp.title_bar_element.visible?}
      $general.scroll(@pdp.add_to_bag_element)    
  end
  @wait.until {@pdp.add_to_bag_element.visible?}
  @pdp.add_to_bag
  @wait.until {@bag.icon_element.visible?}
end


Given /^I tap Checkout$/ do
  @wait.until {@checkout.viewBag_element.visible?}
  @checkout.viewBag
  @wait.until {@checkout.cta_element.exists?}
  @checkout.cta
  sleep 3
end


Given /^I enter (.*?) user details for Checkout$/ do |user|
  sleep 2
  @wait.until {@checkout.email_element.visible?}
  @checkout.email 
  @wait.until {@signinpage.emailfield_element.visible?}
  sleep 1
  case user
    when 'known'
      @signinpage.emailfield = @users.css("known email #{$session}").text
      @wait.until {@signinpage.passwordfield_element.exists?}
      @wait.until {@signinpage.passwordfield_element.visible?}
      @signinpage.passwordfield = @users.css('known password').text
    when 'amex'
      @signinpage.emailfield = @users.css("amex email #{$session}").text
      @wait.until {@signinpage.passwordfield_element.visible?}
      sleep 2
      @signinpage.passwordfield = @users.css('amex password').text
    when 'amexwith_savedCard'
      @signinpage.emailfield = @users.css("amexwith_savedCard email #{$session}").text
      @wait.until {@signinpage.passwordfield_element.visible?}
      sleep 2
      @signinpage.passwordfield = @users.css('known password').text
    when 'guest'
      @signinpage.emailfield = @users.css('guest email').text
      @wait.until {@signinpage.emailValidation_element.visible?}
    when 'staff'
  end
  sleep 2
end

Given /^I select (.*?) as the Shipping destination$/ do |country|
  @wait.until {@checkout.shipping_element.visible?}
  sleep 2
  @checkout.shipping
  @wait.until {@checkout.current_shipping_element.exists?}
  @wait.until {@checkout.current_shipping_element.visible?}
  sleep 2
  if @checkout.current_shipping == country
    # puts country
  else @checkout.changeShippingCtry
    sleep 2
    @wait.until {@checkout.shipping_country_element.exists?}
    @checkout.shipping_country = "#{country}"
    @change_country.doneCTA
    @wait.until {@checkout.current_shipping_element.visible?}
    sleep 3
  end
end


Given /^I select the (.*?) Shipping option$/ do |shipping|
  case shipping
    when 'next day'
      @checkout.next_day
    when 'saturday'
      @checkout.saturday
    when 'express'
      @checkout.express
    when '5 days'
      @checkout.five_days
    when 'collect'
      @checkout.collect
    when 'default'
      @checkout.default_shipping
  end  
  @wait.until {@checkout.shipping_element.visible?}
  sleep 2
end

Given /^I Select a collection store$/ do
  @wait.until {@checkout.address_element.visible?}
  @checkout.address
  @wait.until {@checkout.selectUSState? || @checkout.collection_store_element.visible?}
  if @checkout.selectUSState?  
    @checkout.selectUSState = @addresses.css('us state').text
  end
  sleep 2
  @checkout.collection_store_element.when_visible.click
end


Given /^I add a (.*?) Shipping address$/ do |country|
  
  @wait.until {@checkout.address_element.visible?}
  @checkout.address
  @wait.until {@checkout.add_address_element.visible?}
  @checkout.add_address
  @wait.until {@checkout.address_country?}

  if @checkout.address_country == country
  else @checkout.address_country = country
    sleep 2
  end

  if @checkout.billing_title?
    @checkout.billing_title = 'Mr'
  end

  @checkout.billing_name1 = 'Mobile'
  @checkout.billing_name2 = 'Tester'
  @checkout.billing_line1 = @addresses.css('uk line1').text
  @checkout.billing_phone = @addresses.css('uk phone').text

  case country
    when 'United Kingdom'
      @checkout.billing_city = @addresses.css('uk city').text
      @checkout.billing_region = @addresses.css('uk region').text
      @checkout.billing_postcode = @addresses.css('uk postcode').text
    when 'United States'
      @checkout.address_states = @addresses.css('us state').text
      @checkout.billing_city = @addresses.css('us city').text
      @checkout.address_zipcode = @addresses.css('us postcode').text
    when 'Japan'
      @checkout.gender = @addresses.css('japan gender').text
      @checkout.prefecture = @addresses.css('japan prefecture').text
      @checkout.billing_city = @addresses.css('japan city').text
      @checkout.billing_postcode = @addresses.css('japan postcode').text
  end
  sleep 2
  @checkout.done
  sleep 5

end


Given /^I use my default Shipping address$/ do
  @wait.until {@checkout.address_element.visible?}
  @checkout.address
  @wait.until {@checkout.saved_address_element.visible?}
  @checkout.saved_address
  sleep 1
  @wait.until {@checkout.address_element.exists? && @checkout.address_element.visible?}
  sleep 2
end


Given /^I use my default card details$/ do
  @checkout.known_cardCvv = @cards.css('Visa cvv').text
  #Have to click outside the field to remove prompt warning. Otherwise clicking Checkout will fail
  @browser.find_element(:css, '.js-payment-step .js-notification').click
end

And /^I tap Payment Method$/ do
  @wait.until {@checkout.payment_element.visible?}
  @browser.execute_script("(function(){ window.Modernizr.inputtypes.date = false; return true;})()")
  sleep 2
  @checkout.payment
  sleep 2
end
  And /^I enter my card details$/ do
  @checkout.selectCardType = 'Visa'
  @checkout.cardNumber = @cards.css('Visa number').text
  @checkout.cardName = "Mobile Tester"
  @checkout.cardCvv = @cards.css('Visa cvv').text
  @checkout.cardMonth = '04'
  @checkout.cardYear = '2020'
  sleep 1
end

Given /^I enter a (.*?) Billing address$/ do |country|
  if @checkout.billing_title?
    @checkout.billing_title = 'Mr'
  end
  @checkout.billing_name1 = 'Mobile'
  @checkout.billing_name2 = 'Tester'
  @checkout.billing_line1 = @addresses.css('uk line1').text
  @checkout.billing_phone = @addresses.css('uk phone').text

  case country
    when 'United Kingdom'
      @checkout.billing_city = @addresses.css('uk city').text
      @checkout.billing_region = @addresses.css('uk region').text
      @checkout.billing_postcode = @addresses.css('uk postcode').text
    when 'United States'
  end 
  sleep 2
  #$general.scroll(@checkout.billingdoneBtn_element)
  @checkout.done
  sleep 5
end

Given /^I use my default Billing address$/ do
  @wait.until {@checkout.saved_address_element.exists?}
  if !@checkout.selected_address_element.exists?
    @checkout.scroll(@checkout.saved_address_element)
    @checkout.saved_address_element.click
  end
  @wait.until {@checkout.billingdoneBtn_element.attribute('class').include?('action')}
  @checkout.billingdoneBtn
  @wait.until {@checkout.email_element.visible?}
  sleep 1
end


Given /^I click Order$/ do
  @wait.until {@checkout.order_element.exists?}
  @checkout.scroll(@checkout.order_element)
  sleep 1
  @checkout.order
  sleep 7
end

Then /^the Order Confirmation is displayed$/ do
  @wait.until {@checkout.viewOrderLink_element.visible?}
  @wait.until {@checkout.confirmationEmail_element.visible?}
end

Then /^I can return to the original PDP from Checkout$/ do
  @checkout.done
  @wait.until {@pdp.itemNumber?}
end

Then /^I can go to My Orders$/ do
  @change_language.doneBtn
  @wait.until {@checkout.latestOrderLink_element.visible?}
end

When /^I click View Order Details$/ do
  @checkout.orderDetails
end

Then /^I see the Order Details slate$/ do
  @wait.until {@checkout.orderDetailsSlate_element.visible?}
  sleep 1
end

Then /^my order details are correct$/ do
  @checkout.scroll_slate(@checkout.orderItemName_element)
  assert @checkout.orderItemName_element.text.eql?@products.css("#{@product} title").text
end

When /^I close the Order Details slate$/ do
  @common.closeSlate
  @wait.until {@checkout.viewOrderLink_element.visible?}
  sleep 1
end

#Alipay section
Given /^I select Alipay$/ do
  @wait.until {@checkout.alipay_element.visible?}
  @checkout.alipay
end

Given /^I enter my Alipay details$/ do
  @wait.until {@checkout.billing_name2_element.visible?}
  @checkout.alipay_title = 'Mr'
  @checkout.billing_name2 = 'Tester'
  @checkout.billing_name1 = 'Mobile'
  @checkout.billing_phone = @addresses.css('china phone').text
  @common.done
end

When /^I am redirected to the Alipay processing page$/ do
  @wait.until {@checkout.alipay_submit_element.visible?}
end

When /^Alipay successfully processes my payment$/ do
  @checkout.alipay_code = 'Payment Approved
                '
  @checkout.alipay_submit
  #need code here to confirm successful alipay response once BE bug is fixed
end

When /^Alipay fail to process my payment$/ do
  @checkout.alipay_code = 'Payment Declined
            '
  @checkout.alipay_submit
end




