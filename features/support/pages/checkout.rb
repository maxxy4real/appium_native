class Checkout
  include PageObject

  page_url("#{BASE_URL}/")

#Common
  button(:viewBag, :xpath => '//div[3]/div/a/em')
  link(:cta, :href => '/checkout/')
  button(:back, :css => '.js-checkout-steps a.js-back-button')
  link(:done, :css => '.js-slate-content .a[title="Done"]')
  link(:billingdoneBtn, :css => '.js-toolbar-right .checkout-billing-done-btn')
  link(:order, :css => '.js-order-button')

#Main Slate links
  link(:email, :css => '.js-email-step a')
  link(:shipping, :css => '.js-shipping-step a')
  link(:address, :css => '.js-delivery-step a')
  button(:payment, :css => '.js-payment-step a')
  link(:packaging, :xpath => '//a[contains(text(),"Packaging Options")]')

#Shipping options
  link(:next_day, :xpath => '//span[contains(text(),"Next Day")]')
  link(:saturday, :xpath => '//span[contains(text(),"Saturday")]')
  link(:express, :xpath => '//span[contains(text(),"Express")]')
  link(:collect, :xpath => '//span[contains(text(),"Collect-in-Store")]')
  link(:five_days, :xpath => '//span[contains(text(),"1-5 Days")]')
  link(:default_shipping, :css => '.js-shipping-options li')

  paragraph(:current_shipping, :css => '.js-shipping-notes li strong')

  link(:collection_store, :css => '.js-store-details')

  link(:changeShippingCtry, :css => '.js-change-shipping-country')
  select_list(:shipping_country, :css => 'select[id*="country"]')
  select_list(:selectUSState, :css => '.js-states-filter select')


#Card fields
  link(:addCard, :css => '.js-card a')
  text_area(:savedCvv, :css => '.js-cvv input')
  select_list(:selectCardType, :css => '.js-card select')
  text_area(:cardNumber, :css => 'input[placeholder="Card number"]')
  select_list(:cardMonth, :css => '.js-month select')
  select_list(:cardYear, :css => '.js-year select')
  text_area(:cardName, :css => 'input[placeholder="Name on card"]')
  text_area(:cardCvv, :css => 'input[placeholder="Security code (CVV)"]')
  text_area(:known_cardCvv, :css => 'input[placeholder="CVV"]')

#Alipay fields
  link(:alipay, :css => '.js-alipay a')
  select_list(:alipay_title, :css => 'select[data-qlab="title"]')

#Alipay simulator page
  select_list(:alipay_code, :xpath => '//*[@id="submitalipaypayment"]/p[2]/select')
  button(:alipay_submit, :css => 'input[value="submit"]')

#China Union fields
  link(:china_union, :css => '.js-unionpay a')
  select_list(:china_union_bank, :css => 'select[data-qlab="payment_mode"]')

#China Union simulator page
  select_list(:china_union_code, :id => '_id0:myListBox')
  button(:china_union_submit, :id => '_id0:SubmitAcct')

# Shipping/Billing Address fields
  link(:add_address, :css => '.js-add-address')
  link(:edit_address, :css => 'a.js-card-edit')
  link(:remove_address, :css => 'a.js-remove')
  div(:selected_address, :css => '.js-address-list li.card.active')
  link(:saved_address, :css => '.js-address-list li.card:nth-child(1) .js-content p:nth-child(1)')

  select_list(:address_country, :xpath => '//form/div[1]/div/select[1]')
  text_area(:billing_country, :css => '.filter-search input')
  select_list(:billing_title, :css => 'select[placeholder="First name"]')
  text_area(:billing_name1, :css => 'input[placeholder="First name"]')
  text_area(:billing_name2, :css => 'input[placeholder="Last name"]')
  select_list(:billing_region, :css => 'select[placeholder="Region"]')
  text_area(:billing_city, :css => 'input[placeholder="City"]')
  text_area(:billing_line1, :css => 'input[placeholder="Address line 1"]')
  text_area(:billing_postcode, :css => 'input[placeholder="Postcode"]')
  text_area(:billing_phone, :css => 'input[placeholder="Phone"]')

  # Japan
  select_list(:gender, :xpath => '//form/div[2]/div[1]/div/select')
  select_list(:prefecture, :css => 'select[placeholder="Select prefecture"]')
  # United States
  select_list(:address_states, :css => 'select[placeholder="State"]')
  text_area(:address_zipcode, :css => 'input[placeholder="Zip Code"]')



#Gift Option fields
  link(:sendGift, :css => '.js-gift-select .icn-tick')
  p(:addMessage, :css => '.js-add-message p')
  div(:displayMessage, :css => '.js-add-message .message')
  text_area(:giftMessage, :css => 'textarea[name="giftmessage"]')
  link(:giftDone, :css => '.gift-option a')

#Order Summary
  div(:orderTotal, :css => '.grand-total .hex-4')
  h2(:orderHeader, :css => '.js-toolbar-middle h2')
  button(:orderButton, :css => '.js-order-button.action')
  button(:orderDisabled, :css => '.js-order-button.disabled')
  div(:icon, :css => '.icn-shopping-bag')
  li(:bagItems, :css => '.js-items li')
  button(:bagCTA, :css => '.bag-dashboardsummary .icn-chevron-r')
  button(:bagBackCTA, :css => '.js-back-button ')

#Order Confirmation
  link(:viewOrderLink, :css => '.js-confirmation-information a')
  p(:confirmationEmail, :css => '.js-confirmation-information em')
  link(:latestOrderLink, :css => '.js-results li:nth-child(1)')
  button(:orderDetails, :css => '.js-view-order')

#Order Details
  div(:orderDetailsSlate, :css => '.slate.mybby-orders')
  paragraph(:orderItemName, :css => '.item-description li:nth-child(1) p')
  
  
  def scroll(element)
    $general.scroll(element,'.js-steps-container')  
  end

  def scroll_slate(element)
    $general.scroll(element,'.js-slate-content')
  end

end
