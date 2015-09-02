# Encoding: utf-8

And /^I click the Account Icon$/ do
  @signinpage.myAccountIconCTA
  sleep 1
end

When /^I am on the Account page$/ do
  @account.goto
end

When /^I click on the (.*?) tab$/ do |tab|
  case tab
    when 'Overview'
      @wait.until {@account.overview_element.visible?}
      @account.overview
    when 'Bag'
      @wait.until {@account.overview_element.visible?}
      @account.bag
    when 'Favourites'
      @wait.until {@account.overview_element.visible?}
      @account.faves
    when 'Orders'
      @wait.until {@account.overview_element.visible?}
      @account.orders
    when 'Details'
      @wait.until {@account.overview_element.visible?}
      @account.details
  end
end
