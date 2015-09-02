require 'selenium-webdriver'

#browser can be set at command line, default is Chrome
case ENV['BROWSER']
  when 'safari'
    $browser = Selenium::WebDriver.for :safari
    $browser_name = 'Safari'
    $browser_type=['desktop','mobile']

    $browser.manage.window.resize_to(400, 650)
  when 'mobile'
    $browser = Selenium::WebDriver.for :chrome
    $browser_name = 'Mobile'
    $browser_type=['desktop','mobile']
    $browser.manage.window.resize_to(400, 650)
  when 'chrome'
    $browser = Selenium::WebDriver.for :chrome
    $browser_name = 'Chrome'
    $browser_type=['desktop']
    $browser_type = 'desktop'
  when 'firefox'
    $browser = Selenium::WebDriver.for :firefox
    $browser_name = 'Firefox'
    $browser_type = 'desktop'
    $browser.manage.window.resize_to(400, 650)
end