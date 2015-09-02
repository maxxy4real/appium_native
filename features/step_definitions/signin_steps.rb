# Encoding: utf-8

Given /^I sign in as a (.*?) user$/ do |user|
  @wait.until {@signinpage.myAccountIconCTA_element.visible?}
  @signinpage.myAccountIconCTA
  @wait.until {@signinpage.signin_link_element.visible?}
  @signinpage.signin_link
  @wait.until {@signinpage.emailfield_element.visible?}

  case user
    when 'guest'
      puts "Username = #{@users.css('guest email').text}"
      @signinpage.emailfield = @users.css("guest email #{$session}").text
      @wait.until {@signinpage.passwordfield_element.visible?}
      sleep 2
      @signinpage.passwordfield = @users.css('known password').text
    when 'known'
      @signinpage.emailfield = @users.css("known email #{$session}").text
      @wait.until {@signinpage.passwordfield_element.visible?}
      sleep 2
      @signinpage.passwordfield = @users.css('known password').text
    when 'amex'
      @signinpage.emailfield = @users.css("amex email #{$session}").text
      @wait.until {@signinpage.passwordfield_element.visible?}
      sleep 2
      @signinpage.passwordfield = @users.css('amex password').text
    when 'no_fav'
      @signinpage.emailfield = @users.css("no_fav email #{$session}").text
      @wait.until {@signinpage.passwordfield_element.visible?}
      sleep 2
      @signinpage.passwordfield = @users.css('known password').text
    when 'with_fav'
      @signinpage.emailfield = @users.css("with_fav email #{$session}").text
      @wait.until {@signinpage.passwordfield_element.visible?}
      sleep 2
      @signinpage.passwordfield = @users.css('with_fav password').text
    when 'no_bag'
      @signinpage.emailfield = @users.css("no_bag email #{$session}").text
      @wait.until {@signinpage.passwordfield_element.visible?}
      sleep 2
      @signinpage.passwordfield = @users.css('no_bag password').text
    when 'with_bag'
      @signinpage.emailfield = @users.css("with_bag email #{$session}").text
      @wait.until {@signinpage.passwordfield_element.visible?}
      sleep 2
      @signinpage.passwordfield = @users.css('with_bag password').text
  end

  @wait.until {@signinpage.signin_element.visible?}
  @signinpage.signin
  @wait.until {@menu.back_button_element.visible?}
  sleep 2
  @menu.back_button

  # maybe needed for related tests after logging in
  $api_token = @browser.execute_script("return JSON.parse(window.localStorage.getItem('session')).access_token;")

end


And /^the Signin panel is visible$/ do
  @signinpage.myAccountIconCTA
  @signinpage.signin_link?
  sleep 1
end

And /^I click the Signin link$/ do
  @wait.until {@signinpage.signin_link_element.visible?}
  @signinpage.signin_link
  sleep 1
end

Then /^the Signin button is displayed$/ do
  @bag.scroll(@signinpage.signin_link_element)
end

Given /^I enter (.*?) user details$/ do |user|
  case user
    when 'guest'
      @signinpage.emailfield = @users.css('guest email').text
      @wait.until {@signinpage.passwordfield_element.visible?}
      sleep 2
      @signinpage.passwordfield = @users.css('known password').text
    when 'known'
      @signinpage.emailfield = @users.css("known email #{$session}").text
      @wait.until {@signinpage.passwordfield_element.visible?}
      sleep 2
      @signinpage.passwordfield = @users.css('known password').text
    when 'amex'
      @signinpage.emailfield = @users.css("amex email #{$session}").text
      @wait.until {@signinpage.passwordfield_element.visible?}
      sleep 2
      @signinpage.passwordfield = @users.css('amex password').text
    when 'no_fav'
      @signinpage.emailfield = @users.css("no_fav email #{$session}").text
      @wait.until {@signinpage.passwordfield_element.visible?}
      sleep 2
      @signinpage.passwordfield = @users.css('known password').text
    when 'with_fav'
      @signinpage.emailfield = @users.css("with_fav email #{$session}").text
      @wait.until {@signinpage.passwordfield_element.visible?}
      sleep 2
      @signinpage.passwordfield = @users.css('with_fav password').text
    when 'no_bag'
      @signinpage.emailfield = @users.css("no_bag email #{$session}").text
      @wait.until {@signinpage.passwordfield_element.visible?}
      sleep 2
      @signinpage.passwordfield = @users.css('no_bag password').text
    when 'with_bag'
      @signinpage.emailfield = @users.css("with_bag email #{$session}").text
      @wait.until {@signinpage.passwordfield_element.visible?}
      sleep 2
      @signinpage.passwordfield = @users.css('with_bag password').text
    when 'store_associate'
      @store_associate.associateIDinputField = @users.css('store_associate associateID').text
      @wait.until {@store_associate.storeNumberinputField_element.visible?}
      sleep 1
      @store_associate.storeNumberinputField = @users.css('store_associate storeNumber').text
  end
  sleep 1
end

Given /^I enter (.*?) email$/ do |invalid|
  @signinpage.emailfield = invalid
  sleep 2
end


And /^I insert (.*?) password$/ do |incorrect|
  @signinpage.passwordfield = incorrect
end

And /^I click the Signin submit button$/ do
  @wait.until {@signinpage.signin_element.visible?}
  @signinpage.signin_element.click
  sleep 4
end

And /^I am logged in$/ do
  @wait.until {@signinpage.signoutCTA_element.visible?}
  sleep 2
end

Then /^a warning message appears$/ do
  @signinpage.warningMsgLbl
  sleep 1
end

Then /^an error message appears$/ do
  @signinpage.errorMsgLbl
  sleep 1
end

Then /^I am prompt to register as a new user$/ do
  @signinpage.promtRegMsgLbl
  sleep 1
end

Given /^I click forgotten password link$/ do
  @forgot_password.forgotPasswordLink
  sleep 1
end

And /^I Sign out$/ do
   @signinpage.signoutCTA_element.when_visible.click
   @signinpage.signOutYes
   sleep 1
end

