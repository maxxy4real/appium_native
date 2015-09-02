# Encoding: utf-8

And /^I tap the Favourites CTA$/ do
  $general.scroll(@favourites.favIcnPLP_element)
  @favourites.favIcnPLP_element.when_visible.click
  sleep 2
end

When /^I tap the Favourite icon on PDP page$/ do
  $general.scroll(@favourites.favIcnPDP_element)
  @favourites.favIcnPDP_element.when_visible.click
  sleep 2
end

And /^MyAccount shows as Favourites momentarily$/ do
  @wait.until {@favourites.showNotification_element.visible?}
  sleep 1
end

Then /^I see the icon shows as favourited$/ do
 @wait.until {@favourites.activeFavIcon_element.visible?}
end

When /^I go to My Account$/ do
  @favourites.myAccountIconCTA
end

When /^I click My Favourited icon$/ do
  sleep 1
  @favourites.myFavouritesIcon
end

And /^I tap the Favourites Tab$/ do
  @wait.until {@favourites.favouritesTab_element.visible?}
  @favourites.favouritesTab_element.click
  sleep 2
end

Then /^I see Favourited item$/ do
  @wait.until {@favourites.itemsFavourites_element.visible?}
end

Then /^I tap the Favourited Tab$/ do
 @wait.until {@favourites.itemsFavourites_element.visible?}
 @favourites.itemsFavourites
end

And /^I see sign in to save your favourites$/ do
  @favourites.saveFavourites?
end

And /^Share favourites panel is available$/ do
  sleep 2
  if $browser_type.include? 'mobile'
    @wait.until {@favourites.favouritesPanelMob_element.visible?}
  else
    @wait.until {@favourites.favouritesPanel_element.visible?}
  end
end

When /^I tap Share favourites button$/ do
  if $browser_type.include? 'mobile'
    @wait.until {@favourites.favouritesPanelMob_element.visible?}
    @favourites.favouritesPanelMob
  else
    @wait.until {@favourites.favouritesPanel_element.visible?}
    @favourites.favouritesPanel
  end
end

Then /^I see the Share favourites slate$/ do
  @wait.until {@favourites.publicURL_element.visible?}
end


Then /^And I see how to copy URL link$/ do
  @favourites.copypublicURL?
  sleep 1
end

Then /^I see no Favourited items$/ do
  #sleep 5
  @wait.until {@favourites.noFavourites_element.visible?}
  assert !@favourites.itemsFavourites?
end

And /^I tap Overview$/ do
  @favourites.Overview
  sleep 1
end

Then /^I see No Favourited items on Overview page$/ do
  @favourites.OverviewNoFavourites_element.when_visible
  sleep 1
end

And /^I tap the Favourites preview$/ do
  @wait.until {@favourites.previewFavourites_element.exists?}
  @account.scroll_overview(@favourites.previewFavourites_element)
  @favourites.previewFavourites_element.click
  sleep 1
end

When /^I tap one of the Favourited item$/ do
  @favourites.firstFavouritedItem
end

When /^I tap Remove item link$/ do
  sleep 2
  @wait.until {@favourites.remove_element.visible?}
  @favourites.remove
end

And /^I see message do you want to Remove$/ do
  @favourites.messageToRemoveItem?
end

And /^I tap Yes$/ do
  @favourites.removeYes_element.when_visible.click
end

And /^I tap on notification bag icon$/ do
  @favourites.notificationBag
  sleep 1
end

And /^I tap move to favourites$/ do
  @favourites.moveItemToFavourites
end

And /^I close the share slate$/ do
  @favourites.closeShareSlate
  sleep 1
end

When /^I am shown You have no favourites$/ do
 @wait.until {@favourites.noFavourites_element.visible?}
  sleep 1
end

