class Plp
  include PageObject

  page_url("#{BASE_URL}/mens-shoes/")
  link(:plpcta, :css => 'a[href="/medium-embossed-check-leather-tote-bag-p39286511"]')

  li(:shelf, :css => '.js-shelves .shelf')
  li(:shelf_item, :css => '.shelf-item')
  link(:shelf_item_link, :css => '.shelf-item a')
  li(:last_shelf_item, :css => '.shelf-item:last-of-type')
  link(:last_shelf_item_link, :css => '.shelf-item:last-of-type a')
  link(:view_all, :css => '.shelf-loadmore a')
  link(:detail_view, :css => '.js-intro-tabs-detail a')
  link(:gallery_view, :css => '.js-intro-tabs-gallery a')
  list_item(:description, :css => '.description')
  list_item(:price, :css => '.js-price')
  p(:colours, :css => 'p[data-qa="product-colour"]')

  link(:toolBarLeft, :css => '.icn-chevron-l')


  def item_by_position (position)
    self.class.link(:item, :css => ".js-results li:nth-child(#{position})")
    return self.item_element
  end

  def item_cta (position)
    self.class.link(:item, :css => ".js-results li:nth-child(#{position}) a")
    return self.item_element
  end

  def item_description (position)
    self.class.paragraph(:itemName, :css => ".js-results li:nth-child(#{position}) .description")
    return self.itemName_element
  end

  def scroll(element)
    $general.scroll(element,'#content .slider-item')
  end
end
