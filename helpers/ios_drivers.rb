require 'selenium-webdriver'
require 'yaml'
require 'appium_lib'

@config = YAML.load_file('.config/cucumber.yaml')
#browser can be set at command line, default is Chrome
case ENV['BROWSER']
  when 'iphone_simulator'
    caps = {
        'platformName' => 'iOS',
        'platformVersion' => "#{@config['iphone_sim']['version']}",
        'deviceName' => 'iPhone Simulator',
        'app' => '/usr/local/lib/node_modules/appium/sample_app/UICatalog.app',
        'newCommandTimeout' => '10'
    }
    # Manadtory of Appium specific commands for native apps
    $appium = Appium::Driver.new(:caps => caps, :appium_lib => {'port' => "#{@config['iphone_sim']['port']}"})
    # Only mandtory for use of Selenium page Objects, otherwise not needed
    $browser = $appium.start_driver
    # Optional custom variables used in certain steps
    $browser_name = "iPhone_Simulator_#{@config['iphone_sim']['version']}"
    $browser_type = ['mobile','touch']
  when 'iphone'
    caps = {
        'platformName' => 'iOS',
        'deviceName' => "#{@config['iOS82']['device_name']}",
        'udid' => "#{@config['iOS82']['UDID']}",
        'app' => 'Safari',
        'platformVersion' => "#{@config['iOS82']['version']}"
       # 'browserName' => 'Safari'
    }
    $appium = Appium::Driver.new(:caps => caps, :appium_lib => {'port' => "#{@config['iOS82']['port']}"})
    $browser = $appium.start_driver
    $browser_name = "iPhone"
    $browser_type=['mobile','touch']
  when 'ipad_simulator'
    caps = {
        'platformName' => 'iOS',
        'platformVersion' => "#{@config['ipad_sim']['version']}",
        'deviceName' => 'iPad Simulator',
        'browserName' => 'Safari'
    }
    $appium = Appium::Driver.new(:caps => caps, :appium_lib => {'port' => "#{@config['iOS82']['port']}"})
    $browser = $appium.start_driver
    $browser_name = "iPad_Simulator_#{@config['ipad_sim']['version']}"
    $browser_type=['tablet','touch']
end