class Homepage
  include PageObject

  page_url("#{BASE_URL}/")
# Header
  span(:logo, :css => '.logo')
  h2(:heading, :css => '.js-header h2')

# Body
  div(:firstProductCta, :css => '.media-asset-object:first')
  div(:secondProductCta, :css => '.media-asset-object:eq(1)')
  div(:anyCta, :css => '.media-asset-object')

# Build Label
  button(:build_label, :css => '.js-build-label .icn-cross')

# Cookie Label
  link(:cookie_label, :css => '.js-infobar a')

# Trays
  button(:leftTrayIcon, :css => '.icn-menu')
  button(:rightTrayIcon, :css => '.js-toolbar-right a')
  button(:burberryIcon, :css => '.icn.icn-store')
  div(:leftTray, :css => '.js-tray-left')
  div(:rightTray, :css => '.js-tray-right')
  div(:navMenu, :css => '.nav-menu')
  link(:navLink, :css => '.nav-menu a')
  link(:overviewTab, :css => 'li.active a[href="/my-account/"]')
end