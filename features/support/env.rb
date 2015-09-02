require 'rubygems'
require 'bundler/setup'
require 'selenium-webdriver'
require 'page-object'
require 'test/unit/assertions'
require 'nokogiri'
World Test::Unit::Assertions
require 'active_support/core_ext/time'

require_relative '../../helpers/env_support.rb'
require_relative '../../helpers/api.rb'
require_relative '../../helpers/ios_drivers.rb'
require_relative '../../helpers/android_drivers.rb'
require_relative '../../helpers/browser_drivers.rb'

#set global timeout for Wait command
wait = Selenium::WebDriver::Wait.new(:timeout => 45) # seconds

# If no more webdriver processes are running, 3 lines will be returned. If this is the case then sessions.txt is opened in write mode, so it overwrites anything still in there
# If there are more webdriver processes running, sessions.txt is opened in append mode
ps = `ps ax | grep cucumber`
if ps.lines.count==3
  sessions = open('sessions.txt', 'w+')
else
  sessions = open('sessions.txt', 'a+')
end
sessions.puts $browser_name
# Closes file to finish writing
sessions.close

# Reads file back in and stores the line number that the browser name is found on. This is used as the session number
i=1
File.open('sessions.txt', 'r').each_line do |line|
  if line.strip!.eql? $browser_name
    $session = $.
    break
  end
  i+=1
end
puts "Session = #{$session}"

Before do
  @browser = $browser

  #Page Objects
  @wait = wait
  $general = General.new(wait)
  @search = Search.new(@browser)
  @plp = Plp.new(@browser)
  @pdp = Pdp.new(@browser)
  @homepage = Homepage.new(@browser)
  @signinpage = Signpage.new(@browser)
  @favourites = Favourites.new(@browser)
  @change_country = Change_country.new(@browser)
  @change_language = Change_language.new(@browser)
  @signup = Signup.new(@browser)
  @menu = Menu.new(@browser)
  @checkout = Checkout.new(@browser)
  @forgot_password = Forgot_password.new(@browser)
  @bag = Bag.new(@browser)
  @account = Account.new(@browser)
  @amex_checkout = Amex_checkout.new(@browser)
  @common = Common.new(@browser)
  @store_associate = Store_associate.new(@browser)
  @customer_services = Customer_services.new(@browser)
  @native = Native.new(@browser)

  #Data  
  @users = Nokogiri::XML(File.read('features/support/data/users.xml'))
  @products = Nokogiri::XML(File.read('features/support/data/products.xml'))
  @new_users = Nokogiri::XML(File.read('features/support/data/signup.xml'))
  @addresses = Nokogiri::XML(File.read('features/support/data/addresses.xml'))
  @cards = Nokogiri::XML(File.read('features/support/data/cards.xml'))
  
  #Heroku auth bypass 
  t = Time.utc(Time.now.year, Time.now.month, Time.now.day, 0, 0, 0).to_i
  pass = ((t - 9) / 1000)
  @browser.get("#{BASE_URL}/request-appium-test-access?pass=#{pass}")

  $general.number_to_word($session)
end


After do |scenario|
# $browser.execute_script("window.localStorage.clear();")
# $browser.manage.delete_all_cookies

  if scenario.failed?
  	screenshot = "./screenshots/FAILED_#{$browser_name}_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
  	$browser.save_screenshot(screenshot)
  	embed screenshot, 'image/png'
  end
end

# at_exit do
#    $browser.execute_script("window.localStorage.clear();")
#    $browser.manage.delete_all_cookies
#    $browser.quit
#    # Lists webdriver processes running on the machine
#    ps = `ps ax | grep cucumber`
#    # If no more webdriver processes are running, 2 lines will be returned. If this is the case then sessions.txt is deleted
#    if ps.lines.count==3
#      puts "Deleting from #{$browser_name}"
#      `rm sessions.txt`
#    end

# end
