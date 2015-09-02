class Bag
  include PageObject

  page_url("#{BASE_URL}/my-account/bag")
  link(:icon, :css => '.icn-shopping-bag')

  div(:indicator, :css => '.js-open-bag .js-notification')

  # Bag page
  div(:content, :css => '.js-bag-content')
  li(:item, :css => '.js-bag-content li.card')
  p(:no_bag, :css => '.empty-copy')
  div(:shop_module, :css => '.js-marketing-grid')
  link(:remove, :css => '.js-remove')
  link(:edit, :link_text => 'Edit')
  span(:item, :xpath => '//span[contains(text(),"Item")]')
  li(:quantity, :xpath => '//li[contains(text(),"Quantity")]')
  div(:item_price, :css => '.js-price')

  div(:bag_total, :css => '.grand-total')
  div(:payment_module, :css => '.js-payment-logos')


  link(:item_link, :css => '.info a')
  span(:item, :xpath => '//span[contains(text(),"Item")]')
  li(:quantity, :xpath => '//li[contains(text(),"Quantity")]')
  div(:item_price, :css => '.js-price')
  div(:item_info, :css => '.info')

  div(:bag_total, :css => '.grand-total')
  div(:payment_module, :css => '.js-payment-logos')

  #Remove slate
  link(:yes_alert, :css => '.js-btn1')
  link(:no_alert, :title => 'No')

  #Edit Slate
  select_list(:edit_size, :css => '.js-size select')
  select_list(:edit_quantity, :css => '.js-qty select')



  def scroll(element)
    $general.scroll(element,'.js-mybby-content')  
  end
end
