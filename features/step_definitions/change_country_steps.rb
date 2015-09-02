# Encoding: utf-8

Given /^I am in (.*?)$/ do |user_location|
	@homepage.leftTrayIcon_element.when_visible.click
	sleep 1
	if @browser.capabilities.browser_name == 'Safari' || @browser.capabilities.browser_name == 'safari'
		@browser.execute_script("document.querySelector('.scroll').scrollTop = 600;")
	else
	    @change_country.countryCta_element.scroll_into_view
	end  
	@change_country.countryCta
	sleep 2
	@change_country.country = user_location
	sleep 1
	@change_country.doneCTA
	@wait.until {@homepage.build_label?}
	@homepage.build_label
	sleep 1
end

Given /^I open the change Country slate$/ do
	@homepage.leftTrayIcon_element.when_visible.click
	sleep 1
 	@change_country.countryCta_element.scroll_into_view
 	@change_country.countryCta
 	sleep 1
 	@change_country.doneCTA_element.when_visible
 	sleep 2
end

When /^I change the country to (.*?)$/ do |country|
	@country = country
 	@change_country.country = @country
end

Then /^I should navigate to (.*?) sub-domain$/ do |subdomain|
	sleep 2
	@expectedSubdomain = subdomain
	assert @browser.current_url.include?(@expectedSubdomain), 'Subdomain is not correct'
end

And /^my country is (.*?)$/ do |country|
  @wait.until {@homepage.leftTrayIcon_element.exists?}
  @homepage.leftTrayIcon
  sleep 1
  @country = country
  @change_country.countryCta_element.when_visible
  @change_country.countryCta_element.scroll_into_view
  assert_equal @country, @change_country.countryCta_element.text, 'Country is not correct'
end

When /^I change the URL via (.*?)$/ do |subdomain|
  @extension = subdomain
  @page = "#{BASE_URL}/?country=" + @extension
  @browser.get(@page)
  sleep 1
end

