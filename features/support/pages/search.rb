# Encoding: utf-8

class Search
  include PageObject

  link(:cta, :css => 'a.js-search-anchor')
  button(:taxonomy_cta, :css => '.taxonomy-cell .icn-search')
  link(:searchBtn, :css => '.search-button a')
  button(:cancel, :css => '.js-cancel')
  text_area(:input, :css => '.js-search-input')
  button(:clear, :css => '.js-clear')
  div(:recentSearchHeader, :css => '.js-header')
  unordered_list(:recentSearchTerms, :css => '.js-recent-searches')
  list_item(:recentSearchTerm, :css => '.js-recent-searches li')
  list_item(:firstRecentSearchTerm, :css => '.js-recent-searches li:nth(0)')
  list_item(:re_enteredTerm, :css => '.js-recent-searches li:contains("trench")')
  button(:recentSearchFind, :css => '.js-recent-searches .icn-search')
  button(:removeRecent, :css => '.js-remove')
  paragraph(:specificItem, :css => '.description:contains("The Medium Orchard in Signature Grain Leather")')
  paragraph(:currencyItem, :css => '.js-product-information .current:contains("$")')
  link(:update, :css => '.js-update-search') 
  paragraph(:count, :css => '.search-information-count')
  paragraph(:noResult, :css => '.js-search-no-products')
  div(:resultItem, :css => '.js-results .media-asset-object')


  #facets
  link(:facet_arrow, :css => '.js-facets-arrow')
  link(:clear_filters, :text => 'Clear all filters')
  list_item(:facet_status, :css => '.facets-item-active')
  link(:detail_view, :text => 'View : Detail view')
  div(:list_view_tick, :css => '.js-filters-set li:nth-child(1) .icn')
  div(:detail_view_tick, :css => '.js-filters-set li:nth-child(2) .icn')


  link(:view, :text => 'View')
  span(:list, :text => 'List view')
  list_item(:gallery, :text => 'Gallery view')
  text_area(:specialTerm, :text => 'pitón')

end