require 'selenium-webdriver'
require 'yaml'
require 'appium_lib'

@config = YAML.load_file('.config/cucumber.yaml')

#browser can be set at command line, default is Chrome
case ENV['BROWSER']
  when 'android50'
    caps = {
        'platformName' => 'Android',
        'deviceName' => "#{@config['android50']['UDID']}",
        'platformVersion' => "#{@config['android50']['version']}",
        'browserName' => 'chrome'
    }
    $appium = Appium::Driver.new(:caps => caps, :appium_lib => {'port' => "#{@config['android50']['port']}"})
    $browser = $appium.start_driver
    $browser_name = "Android"
    $browser_type=['mobile','touch']
  when 'android43'
    caps = {
        'platformName' => 'Android',
        'deviceName' => '32304b90c269c02f',
        'platformVersion' => '5.0.1',
        'browserName' => 'chrome'
    }
    $appium = Appium::Driver.new(:caps => caps, :appium_lib => {'port' => '4726'})
    $browser = $appium.start_driver
    $browser_name = "Android"
    $browser_type=['mobile','touch']
  when 'emdroid'
    caps = {
        'platformName' => 'Android',
        'deviceName' => 'Android Emulator',
        'platformVersion' => '5.1',
        'browserName' => 'chrome'
    }
    $appium = Appium::Driver.new(:caps => caps, :appium_lib => {'port' => '4726'})
    $browser = $appium.start_driver
    $browser_name = "Android"
    $browser_type=['mobile','touch']
end