class Common
  include PageObject

  link(:done, :css => '.js-toolbar-right a[title="Done"]')

# Notifications
  div(:warning, :css => '.notification-warning')
  div(:error, :css => '.notification-error')
  link(:closeSlate, :css => '.icn-cross')

end