# Encoding: utf-8

Given /^I click on Buttons$/ do
  puts $appium
  puts @browser
  # @wait.until {@browser.find_element(:xpath, '//UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIATableCell[1]').exists?}
  # $appium.find_element(:id, 'Buttons').click
  @native.buttons
  @wait.until {$appium.find_element(:id, 'imageButton').displayed?}
  @native.back
  puts 'Made It'
  sleep 2
end





