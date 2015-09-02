class Forgot_password
  include PageObject

  page_url("#{BASE_URL}/")

# Input Boxes


# Button


# Link
  link(:forgotPasswordLink, :css => ".js-forgot-passwd")


# div
  div(:warningMsgLbl, :css => 'p.notification-message')
  div(:errorMsgLbl, :css => '.notification.notification-error')


# text_area
  text_area(:forgotPswHeader, :css => 'h2.h.h1-1.hex-1')
  area(:iconNotification, :css => '.js-icon-right')

 
end

