# Encoding: utf-8

Given /^I am on the Home page$/ do
  @homepage.goto
  @wait.until {@homepage.logo_element.visible?}
end

When /^I refresh the page$/ do
  @browser.navigate.refresh
  sleep 5
end

And /^Im Logged out of the app$/ do
  if @signinpage.icnprofile?

     @signinpage.myAccountIconCTA 
     @signinpage.signoutCTA_element.when_visible.click
     @signinpage.signOutYes
     sleep 1
     @homepage.goto
     @wait.until {@homepage.logo_element.visible?}

  end
end

Given /^I clear the local storage$/ do
    @browser.execute_script("window.localStorage.clear();")
end

And /^I click the menu back button$/ do
  @menu.back_button
  sleep 1
end

When /^I go back$/ do
  # @browser.navigate.back
  # use js below because above method does not work with Safari
  @browser.execute_script("window.history.back();")
end

Given /^I dismiss the build label$/ do
  if @homepage.build_label?
    @homepage.build_label
    sleep 1
  end
end

Given /^I dismiss the cookie label$/ do
  if @homepage.cookie_label?
    @homepage.cookie_label
    sleep 1
  end
end

And /^I click the toolbar navigation$/ do
  @wait.until {@menu.tool_navigation_element.visible?}
  @menu.tool_navigation
  sleep 1
end

When /^I open the navigation menu$/ do
  @homepage.leftTrayIcon_element.when_visible.click
  sleep 2
end

When /^I navigate to the next taxonomy level$/ do
  @menu.men
end

When /^I navigate to another page via the nav menu$/ do
  @menu.women
  @wait.until {@menu.newArrivals_element.visible?}
  @menu.newArrivals
end

And /^I click Done$/ do
  @change_country.doneCTA
  sleep 4
end

And /^I navigate to the Fragrances Category page via the nav menu$/ do
  @menu.beautyLink
  sleep 1
  @menu.fragranceLink
end

Given /^I am on a page with a taxonomy cell$/ do
  @browser.get("#{BASE_URL}/girl/")
  @homepage.logo_element.when_visible
  sleep 1
end

Given /^I am on a Monogram PDP page$/ do
  @browser.get("#{BASE_URL}/heritage-check-cashmere-scarf-p39295221/")
  @homepage.logo_element.when_visible
  sleep 1
end

Then /^I Navigate to the Shipping sub page$/ do
  @homepage.heading_element.when_visible
  assert_equal "#{BASE_URL}/customer-service/shipping/", @browser.current_url, 'page url is incorrect'
end

Given /^I am already on the (.*?) page$/ do |page|
  @extension = page
  @page = "#{BASE_URL}/" + @extension
  @browser.get(@page)
  sleep 1
end

Then /^I am still on the (.*?) page$/ do |page|
  @page = page
  #Removes query string from URL before comparing
  currentPage = @browser.current_url.split('?')[0]
  assert_equal "#{BASE_URL}/" + @page, currentPage, 'page url is incorrect'
end

Then /^the warning message is displayed$/ do
  @wait.until {@common.warning?}
  @bag.scroll(@common.warning_element)
end


# data example
Given /^I output every user first name$/ do
  #Iterate through all user emails in xml and chcek they include @ symbol
  @data = @users.css('test_users email')
  
  @data.each do |email|
    assert email.text.include?('@'), 'invalid email'
  end

  #Or drill down to a particular user and get the first name
  puts @users.css('user1 firstName').text
end


