# Encoding: utf-8

When /^I tap the Change Language cta$/ do
 	@change_language.languageCta_element.scroll_into_view
 	@change_language.languageCta
 	sleep 2
end

When /^I select (.*?) from the language list$/ do |language|
  @change_language.language_from_list(language).click
  i=1
  # Finds the position of the language in the list
  @wait.until {@change_language.language_by_position(1).exists?}
  while @change_language.language_by_position(i).exists?
    if @change_language.language_by_position(i).text.eql? language
      break
    end
    i+=1
  end
  # Waits until the selected language tick moves to the correct language
  @wait.until {@change_language.find_language_tick == i}
end

When /^I click Done on the Language slate$/ do
  @change_language.doneBtn
  sleep 2
end

Then /^I can see the Change Language cta$/ do
  assert @change_language.languageCta_element.visible?, 'Change language cta is not visible'
end

Then /^I cannot see the Change Language cta$/ do
  assert !@change_language.languageCta_element.visible?, 'Change language cta is not visible'
end

Then /^the Change Language slate opens$/ do
  assert @change_language.slate_element.visible?, 'Change language slate is not visible'
  assert @change_language.language_by_position(1).visible?, 'Languages are not visible on slate'
end

Then /^([0-9]+) different languages are displayed$/ do |num|
  assert @change_language.language_by_position("#{num}").visible?, "There are less than #{num} languages"
  assert !@change_language.language_by_position("#{num}".to_i + 1).visible?, "There are more than #{num} languages"
end

Then /^(.+) has a tick by it$/ do |language|
  assert @change_language.current_element.visible?, "There is no tick next to any languages"
  i=1
  @wait.until {@change_language.language_by_position(1).exists?}
  # Finds the position of the language in the list
  while @change_language.language_by_position(i).exists?
    if @change_language.language_by_position(i).text.eql? language
      break
    end
    i+=1
  end
  # Waits until the selected language tick moves to the correct language
  @wait.until {@change_language.find_language_tick == i}
end

Then /^the Done button reads (.+)$/ do |done|
  #When using the POM, .text was coming back blank.
  assert((@browser.find_element(:css, '.btn.btngrp-1').text.eql? "#{done}"), "Done button does not read #{done}")
end

When /^I change language to (.+)$/ do |language|
  @change_language.languageCta_element.scroll_into_view
  @change_language.languageCta
  @wait.until {@change_language.language_by_position(1).visible?}
  sleep 1
  @change_language.language_from_list(language).click
  i=1
  @wait.until {@change_language.language_by_position(1).exists?}
  # Finds the position of the language in the list
  while @change_language.language_by_position(i).exists?
    if @change_language.language_by_position(i).text.eql? language
      break
    end
    i+=1
  end
  # Waits until the selected language tick moves to the correct language
  @wait.until {@change_language.find_language_tick == i}
  @change_language.doneBtn
  sleep 1
end

Then /^the Language slate closes$/ do
  assert !@change_language.slate_element.visible?, 'Change language slate is not visible'
end

Then /^the same PLP page is reloaded in (.+)$/ do |language_code|
  @wait.until { @homepage.logo_element.visible? }
  assert((@change_language.html_element.attribute("lang").eql? "#{language_code}"), "page was not loaded in the correct language")
end

Then /^the Women link in the Nav Menu reads (.+)$/ do |women|
  sleep 1
  menuText=@menu.women_element.text  
  assert((menuText.eql? "#{women}"), "Women link read #{menuText} instead of #{women}")
end

Then /^the same PDP page is reloaded in (.+)$/ do |language_code|
  assert((@browser.current_url.eql? @pdp.page_url_value), "Not directed back to the PDP")
  assert((@change_language.html_element.attribute("lang").eql? "#{language_code}"), "PDP is in the wrong language")
end