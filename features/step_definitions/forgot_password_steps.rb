# Encoding: utf-8

Then /^I should see forgotten password page$/ do
  @forgot_password.forgotPswHeader?
  sleep 1
end

And /^I wait for validation response$/ do
  @forgot_password.iconNotification
  sleep 1
end