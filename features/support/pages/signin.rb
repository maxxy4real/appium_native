class Signpage
  include PageObject

  page_url("#{BASE_URL}/")

# Input Boxes
  text_field(:emailfield, :css => 'input[type="Email"]')
  text_field(:passwordfield, :css => 'input[type="password"]')


# Button
  button(:signin_link, :css => 'a.js-signin.a.btn')
  button(:signin, :css => '.btn[type="submit"]')
  button(:signOutYes, :css => '.js-btn-logout')


# Link
  link(:myAccountIconCTA, :css => '.js-open-mybby')
  link(:signoutCTA, :css => '.js-signout-prompt')


# div
  div(:warningMsgLbl, :css => 'p.notification-message')
  div(:errorMsgLbl, :css => '.notification.notification-error')
  div(:promtRegMsgLbl, :css => '.notification-message')
  div(:icnprofile, :css => '.js-toolbar-right.logged-in .icn.icn-profile')
  div(:emailValidation, :css => '.js-email-edit .js-icon-right')

end