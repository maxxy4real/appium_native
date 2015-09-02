class Account
  include PageObject

  page_url("#{BASE_URL}/my-account")
  h1(:header, :css => '.my-account-title')

  link(:overview, :css => '.js-tabbed-list .icn-grid')
  link(:bag, :css => '.js-tabbed-list .icn-shopping-bag')
  link(:faves, :css => '.js-tabbed-list .icn-star')
  link(:orders, :css => '.js-tabbed-list .icn-van')
  link(:details, :css => '.js-tabbed-list .icn-v-card')

  def scroll_overview(element)
    $general.scroll(element, '.mybby-overview')
  end
end
