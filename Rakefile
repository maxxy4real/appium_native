require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'yaml'

desc "Loads cucumber config file"
task :init do
  @config = YAML.load_file('.config/cucumber.yaml')
end

#Frequent tasks

desc "Starts the appium server for devices (port and device ID specified)"
task :appium, [:port, :udid] do |t, args|
  system "appium -p #{args[:port]} -U '#{args[:udid]}' &"
end

desc "Starts Appium from node"
task :appium_node, [:port, :udid] do |t, args|
  system "node #{@config['appium_path']}/lib/server/main.js -p #{args[:port]} -U '#{args[:udid]}' --command-timeout 120 &"
end

desc "Starts ios webkit debug proxy"
task :ios_webkit, [:udid] do |t, args|
  system "ios_webkit_debug_proxy -c #{@config['iOS82']['UDID']}:27753 -d &"
end

desc "Starts the appium server for simulator (only port specified)"
task :appium_sim, [:port, :udid] do |t, args|
  system "appium -p #{args[:port]} --command-timeout 120 &"
end

# Browsers

desc "Runs init, launches ios webkit debug proxy, then appium server, then runs test suite on iphone profile"
task :ios82 => :init  do |t|
  Rake::Task["ios_webkit"].invoke("#{@config['iOS82']['UDID']}")
  Rake::Task["appium_node"].invoke("#{@config['iOS82']['port']}", "#{@config['iOS82']['UDID']}")
  puts "Waiting for appium to start.  Not an intelligent wait"
  sleep 15
  puts "going to start cucumber"
  system "cucumber #{@config['iOS82']['all']['qa']}"
end

desc "Runs init, launches appium server, then runs test suite on android50 profile"
task :android50 => :init  do |t|
  Rake::Task["appium"].invoke("#{@config['android50']['port']}", "#{@config['android50']['UDID']}")
  puts "Waiting for appium to start.  Not an intelligent wait"
  sleep 15
  puts "going to start cucumber"
  system "cucumber #{@config['android50']['all']['qa']}"
end

desc "Runs init, launches appium simulator server, then runs test suite on iphone simulator profile"
task :ios_sim => :init  do |t|
  Rake::Task["appium_sim"].invoke("#{@config['iphone_sim']['port']}")
  puts "Waiting for appium to start.  Not an intelligent wait"
  sleep 15
  puts "going to start cucumber"
  system "cucumber #{@config['iphone_sim']['all']['qa']}"
end

desc "Runs init, then runs test suite on Chrome"
task :chrome => :init do |t|
  system "cucumber #{@config['chrome']['all']['qa']}"
end

desc "Runs init, then runs test suite on Safari"
task :safari => :init do |t|
  system "cucumber #{@config['safari']['all']['qa']}"
end

desc "Runs init, then runs test suite on Firefox"
task :firefox => :init do |t|
  system "cucumber #{@config['firefox']['all']['qa']}"
end

desc "Runs init, then runs test suite on Chrome, Firefox and Safari"
multitask :browsers => [:chrome, :safari, :firefox]

# Cleanup

desc "Kills appium (node) and ios webkit debug proxy processes"
task :cleanup do
  system "killall node & killall ios_webkit_debug_proxy"
end