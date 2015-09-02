class Favourites
  include PageObject

# Div
  div(:showNotification, :css => '.show-notification')
  
  
  # Link
  link(:favouritesTab, :xpath => '//li[3]/a/span/span')
  link(:fragrancePDP, :xpath => '//article[@id="content"]/div/div/div/ul[2]/li/ul/li/a/div[2]')
  link(:previewFavourites, :css => '.js-favourites-summary li')
  button(:remove, :xpath => '//li/div/ul/li/a')                        
  link(:moveItemToFavourites, :css => '.js-move-to-favourites')
  link(:closeShareSlate, :css => '.icn-cross')


  # Image
  image(:itemsFavourites, :css => '.js-favourites-list li')
  button(:firstFavouritedItem, :css => 'img.media-asset-object')
 

  # h1
  h1(:saveFavourites, :css => '.js-signin .h')
  h1(:noFavourites, :css => '.no-favourites')
  h1(:OverviewNoFavourites, :css => '.js-favourites-summary .h2-3')
  h1(:publicURL, :css => '.public-url')
  h1(:copypublicURL, :css => 'span:contains("Press and hold the link to copy")')
  h1(:messageToRemoveItem, :css => '.js-confirm .p')


  # Button
  button(:favIcnPLP, :css => '.js-favourite')
  button(:favIcnPDP, :css => '.js-button')
  button(:activeFavIcon, :css => '.js-button.active')
  button(:myAccountIconCTA, :css => '.icn.icn-profile')
  button(:myFavouritesIcon, :css => 'span.icn.icn-star')
  button(:Overview, :css => '.icn.icn-grid')
  button(:favouritesPanelMob, :css => '.js-share-button')
  button(:favouritesPanel, :css => '.share-content a')
  button(:removeYes, :css => '.btn.btngrp-1.btnitm-2.js-btn1')
  button(:notificationBag, :css => '.js-open-bag')
  button(:addToBag, :xpath => '//div[4]/div/a/em')


end
