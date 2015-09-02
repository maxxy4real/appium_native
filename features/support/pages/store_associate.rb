class Store_associate
  include PageObject

  page_url("#{BASE_URL}/store-associate/")
 
# Input Boxes
  text_field(:associateIDinputField, :xpath => '//input')
  text_field(:storeNumberinputField, :xpath => '//div[2]/div/input')

# Button
  button(:associateSigninLink, :css => '.btn.btngrp-1')
  button(:signoutIcon, :css => '.infobar-button')
  button(:alertNo, :css => '.js-btn0')
  button(:alertYes, :css => '.js-btn1')

# div
  div(:associateIcon, :css => '.js-store-associate-identifier-link')
  div(:alertTitle, :css => 'strong')
  div(:associateID, :css => '.confirmation-associate-id')
  div(:storeNumber, :css => '.confirmation-associate-storeid')
end