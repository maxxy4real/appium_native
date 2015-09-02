class Amex_checkout
  include PageObject

  # Link
  link(:bagTab, :css => '.icn-shopping-bag')

  # Button
  link(:amexBtn, :css => '.amexExpressCheckOutImage')
  button(:nextBtn, :css => '.blueBtn')
  button(:DoneBtn, :css => 'button.btn.btngrp-1')
  button(:CancelBtn, :css => '.cancelBtn')

  # Image
  link(:amexCardType, :css => '.cardImg')
  
  # Header
  h1(:shipp_address, :xpath => '//div/p[2]')
  h1(:bill_address, :xpath => '//li[2]/div/p[2]')
  
  # Image
  link(:amexCardType, :css => '.cardImg')

  # Input Boxes
  text_field(:amexUserID, :css => '#userid.ax-input')
  text_field(:amexPswdfield, :css => '#password.ax-input')
  text_field(:cidPinBox, :xpath => '//form[@id="form-chooseCard"]/div[2]/div/div/div[2]/div/input')

  # Check Boxes
  checkbox(:saveCard, :css => '.checkbox.icn')


  # h1
  h1(:bagEmpty, :css => '.empty-copy')


end