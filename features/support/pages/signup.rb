
# Encoding: utf-8

class Signup
  include PageObject

# Button
  button(:register, :css => '.js-signup')
  button(:nextDisabledCTA, :css => '.btn.disabled[title="Next"]')
  button(:nextActiveBtn, :css => '.btn.action[title="Next"]')
  link(:subscribeCTA, :css => '.toggle-item')
  link(:subscribedCTA, :css => '.toggle-item.toggle-item-active')


# Link
  link(:subscribeCTA, :css => '.toggle-item')
  link(:subscribedCTA, :css => '.toggle-item.toggle-item-active')
  link(:signoutCTA, :css => '.js-signout-prompt')
  link(:signoutCTA, :css => '.js-signout-prompt')
  link(:signinCTA, :css => 'a.js-registered-signin')
  

# Input Boxes
  text_field(:firstNameTxtFld, :css => 'input[placeholder="First name"]')
  text_field(:lastNameTxtFld, :css => 'input[placeholder="Last name"]')
  text_field(:emailTxtFld, :css => '.slate input[placeholder="Email"][type="email"]')
  text_field(:createPasswordTxtFld, :css => 'input[placeholder="Create password"]')
  text_field(:phoneTxtFld, :css => 'input[placeholder="Phone"]')
  text_field(:countryTxtFld, :css => '.filter-search input')


# div
  div(:errorMsgBanner, :css => '.input-wrapper-error input[placeholder="Create password"]')
  div(:warningMsgLbl, :css => 'p.notification-message')
  div(:regcontainer, :css => '.js-registration-container')
  div(:errorMsgBanner, :css => '.input-wrapper-error')

  
# list Items
  select_list(:titleDrpDown, :name => 'title')
  select_list(:chooseGenderOptn, :css => '.form-group select')


# checkbox
  checkbox(:tickIconImg, :css => '.js-icon-right.icn.icon-right.icn-tick')
  checkbox(:collectPersonalChkBox, :css => '.slate input[type="checkbox"][id="checkbox_collect_personal_info_opt_in"]')
  checkbox(:thirdPartyOptinChkBox, :css => '.slate input[type="checkbox"][id="checkbox_third_party_opt_in"]')
  checkbox(:emailOptinChkBox, :css => '.slate input[type="checkbox"][id="checkbox_email_opt_in"]')
  checkbox(:teleMarketingOptChkBox, :css => '.slate input[type="checkbox"][id="checkbox_tele_marketing_opt_in"]')


# text_area
  text_area(:signupHeader, :css => '.js-toolbar-middle .h.hex-1')
  area(:selectCountry, :css => '.filter-results .list a')
  
end