# Encoding: utf-8

When /^I tap register account CTA$/ do
  @wait.until {@signup.register_element.visible?}
  @signup.register
  sleep 2
end

Then /^registration slate is displayed$/ do
  @signup.signupHeader?
  sleep 1
end

When /^I enter all the (.*?) data in the Registration form$/ do |code|

  case code
    when 'UKuser'
      @signup.titleDrpDown = @new_users.css('UKuser title').text
      @signup.firstNameTxtFld = @new_users.css('UKuser firstName').text
      @signup.lastNameTxtFld = @new_users.css('UKuser lastName').text
      @signup.createPasswordTxtFld = @new_users.css('UKuser password').text
      @signup.phoneTxtFld = @new_users.css('UKuser phone').text
      sleep 1

    when 'ChinaUser'
      @signup.countryTxtFld = @new_users.css('ChinaUser country').text
      @wait.until {@signup.selectCountry_element.visible?}
      @signup.selectCountry
      sleep 1
      @signup.titleDrpDown = @new_users.css('ChinaUser title').text
      @signup.lastNameTxtFld = @new_users.css('ChinaUser lastName').text
      @signup.firstNameTxtFld = @new_users.css('ChinaUser firstName').text
      @signup.createPasswordTxtFld = @new_users.css('ChinaUser password').text
      @signup.phoneTxtFld = @new_users.css('ChinaUser phone').text
      sleep 1

   	when 'USUser'
      @signup.countryTxtFld = @new_users.css('USUser country').text
      @wait.until {@signup.selectCountry_element.visible?}
      @signup.selectCountry
      sleep 1
      @signup.titleDrpDown = @new_users.css('USUser title').text
      @signup.firstNameTxtFld = @new_users.css('USUser firstName').text
      @signup.lastNameTxtFld = @new_users.css('USUser lastName').text
      @signup.createPasswordTxtFld = @new_users.css('USUser password').text
      @signup.phoneTxtFld = @new_users.css('USUser phone').text
      sleep 1

	when 'JapanUser'
      @signup.countryTxtFld = @new_users.css('JapanUser country').text 
      @wait.until {@signup.selectCountry_element.visible?}
      @signup.selectCountry
      sleep 1
      @signup.chooseGenderOptn = @new_users.css('JapanUser gender').text
      @signup.lastNameTxtFld = @new_users.css('JapanUser lastName').text
      @signup.firstNameTxtFld = @new_users.css('JapanUser firstName').text
      @signup.createPasswordTxtFld = @new_users.css('JapanUser password').text
      @signup.phoneTxtFld = @new_users.css('JapanUser phone').text
      sleep 1

  when 'KoreaUser'
      @signup.countryTxtFld = @new_users.css('KoreaUser country').text
      @wait.until {@signup.selectCountry_element.visible?}
      @signup.selectCountry
      sleep 1
      @signup.lastNameTxtFld = @new_users.css('KoreaUser lastName').text
      @signup.firstNameTxtFld = @new_users.css('KoreaUser firstName').text
      @signup.createPasswordTxtFld = @new_users.css('KoreaUser password').text
      @signup.phoneTxtFld = @new_users.css('KoreaUser phone').text
      sleep 1

  when 'Incompleteuser'
      @signup.titleDrpDown = @new_users.css('Incompleteuser title').text
      @signup.firstNameTxtFld = @new_users.css('Incompleteuser firstName').text
      @signup.lastNameTxtFld = @new_users.css('Incompleteuser lastName').text
      sleep 1
 end
end

And /^I enter email address$/ do
      @rand = SecureRandom.hex(3)
      @signup.emailTxtFld = "test@#{@rand}.com"
      sleep 3

end

And /^I tap on the active Next button$/ do
  @signup.nextActiveBtn?
   @signup.nextActiveBtn
  sleep 3
end

When /^I enter (.*?) email in Registration form$/ do |invalid|
  @signinpage.emailfield = invalid
  sleep 2
end

And /^I enter (.*?) password format$/ do |pswrules|
  @signup.createPasswordTxtFld = pswrules
  sleep 1
end

Then /^displays a tick after validating the field$/ do
  @signup.tickIconImg_element
  sleep 1
end

When /^I click Signin CTA$/ do
   @signup.signinCTA
   sleep 2
end

Then /^the Signin slate appears$/ do
   @signup.regcontainer_element
   sleep 1
end

And /^email is prepopulated with (.*?)$/ do |email|
    assert_equal email, @signup.emailTxtFld_element.attribute("value")
      #assert_equal "register@gmail.com", @browser.find_element(:css, "#view900-email").attribute("value")
end

When /^I tap on the disabled Next button$/ do
   @signup.nextDisabledCTA
  sleep 2
end

Then /^all the incomplete fields are highlighted$/ do
  @signup.errorMsgBanner_element
  sleep 1
end

Then /^Burberry updates is shown$/ do
  @signup.subscribeCTA_element
end

When /^I subscribe for email$/ do
  @signup.subscribeCTA
end

Then /^I am registered$/ do
  @signinpage.signOutYes_element
  sleep 1
end

And /^I am subscribed$/ do
  @signup.subscribedCTA_element
  sleep 1
end

And /^I select the Mandatory checkboxes$/ do
  @signup.check_collectPersonalChkBox
  @signup.check_thirdPartyOptinChkBox
  sleep 1
end

And /^I select the Optional checkboxes$/ do
  @signup.check_emailOptinChkBox
  @signup.check_teleMarketingOptChkBox
  sleep 1
end

And /^I am registered and logged in automatically$/ do
  @signinpage.signoutCTA?
  sleep 2
end

When /^I click the Create an account CTA$/ do
  @Signup.register?
  @Signup.register
  sleep 1
end


