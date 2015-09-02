# Encoding: utf-8

class Menu
  include PageObject

  link(:nav_link, :css => '.js-nav-list a')
  link(:men, :css => ".js-nav-list a[href='/men/']")
  link(:women, :css => ".js-nav-list a[href='/women/']")
  link(:newArrivals, :css => ".js-nav-list a[href='/womens-new-arrivals-new-in/']")
  link(:beautyLink, :css => ".js-nav-list a[href='/beauty/']")
  link(:fragranceLink, :css => ".js-nav-list a[href*='mens-fragrance']")
  link(:fragrancePLPlink, :css => ".js-nav-list a[href*='brit-rhythm']")
  link(:stores, :css => ".js-nav-list a[href='/store-locator/']")
  link(:tool_navigation, :css => '.icn-chevron-l')
  link(:back_button, :css => '.icn-chevron-l')
  
end