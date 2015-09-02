# Encoding: utf-8

class Pdp
  include PageObject

  page_url("#{BASE_URL}/the-sandringham-mid-length-heritage-trench-coat-p39004551")
  h1(:title_bar, :css => '.titlebar-text')
  # list_item(:description, :css => '.description')
  h1(:itemName, :css => 'h1.titlebar-text')
  div(:carousel, :css => '.js-carousel-track')
  div(:itemNumber, :css => '.product-id')
  div(:itemPrice, :css => '.js-price')
  list_item(:description, :xpath => '//li[3]/p')
  div(:shippingRestrictions, :css => '.shipping-restrictions.msg')
  link(:descriptionTabCTA, :css => '.js-tabs-nav .tabs-nav-item:nth-child(1)')
  link(:shippingTabCTA, :css => '.js-tabs-nav .tabs-nav-item:nth-child(2)')
  div(:shippingInfo, :css => 'ul.shipping-returns')
  list_item(:features, :css => '.description .features-set')
  div(:colourPicker, :css => '.js-colour-picker')
  div(:colourCTA, :css => '.js-carousel-toggler')
  label(:colourName, :css => '.swatch h3 span:nth-child(1)') # To be replaced with '.colour-name' when it's reinstated
  label(:moreColours, :css => '.swatch h3 span:nth-child(2)') # To be replaced with '.more-colours' when it's reinstated
  div(:colourCarousel, :css => '.js-colour-picker .optioncarousel-picker')
  div(:selectedColour, :css => '.js-colour-picker .optioncarousel-picker .carousel-item.selected a')
  div(:size, :css => '.product-cta')
  select(:size_cta, :css => '.product-cta select')
  link(:add_to_bag, :css => '.js-add-to-bag a')
  link(:contactUsCTA, :css => 'a[href="/customer-service/"].btn')
  div(:sharingCell, :css => '.share')
  div(:recommendedItems, :css => '.js-recommended-items')
  image(:fullscreenImage, :css => '.js-fullscreen-content img')
  button(:closeImage, :css => '.js-btn.icn-cross')
  label(:bagMessage, :css => '.js-bag-message')
  link(:addAnotherCTA, :css => '.js-bag-message a')
  button(:viewBag, :css => '.js-view-bag')
  label(:bagNotification, :css => '.js-mybby .js-notification')
  link(:add_another, :css => '.add-another-message a')
  link(:view_bag, :css => '.js-view-bag a')
  p(:max_items, :css => '.js-bag-message p')

  # link(:checkout, :css => '.js-checkout a')

  def recommendedItem (i)
    self.class.div(:recItem, :css => ".js-recommended-items li:nth-child(#{i}) a")
    return self.recItem_element
  end

  def recommendedItemName (i)
    self.class.label(:recName, :css => ".js-recommended-items li:nth-child(#{i}) .item-name")
    return self.recName_element
  end

  def recommendedItemPrice (i)
    self.class.label(:recPrice, :css => ".js-recommended-items li:nth-child(#{i}) .price")
    return self.recPrice_element
  end

  def carouselImage (i)
    self.class.div(:img, :css => ".js-carousel-container li:nth-child(#{i})")
    return self.img_element
  end

  def visibleImages
    carousel=$browser.find_element(:css, '.js-carousel-track')
    carouselLeft=carousel.location.x
    carouselRight=carousel.location.x + carousel.size.width
    imgs=Array.new
    i=1
    #For each image in the carousel, check image position is within the bounds of the carousel
    while self.carouselImage(i).exists?
      #Don't even ask (calling .location.x on carousel images was scrolling to that image on iOS. Had to use javascript instead)
      imagePos=$browser.execute_script("var rect = document.querySelector('.js-carousel-container li:nth-child(#{i})').getBoundingClientRect();return rect.left;")
      if imagePos.between?(carouselLeft,carouselRight)
        imgs.push(i)
      end
      i+=1
    end
    return imgs
  end

  def colourCarouselItem (i)
    self.class.div(:colourImg, :css => ".js-colour-picker .optioncarousel-picker li:nth-child(#{i})")
    return self.colourImg_element
  end

  def colourItemLink (i)
    self.class.div(:colourLink, :css => ".js-colour-picker .optioncarousel-picker li:nth-child(#{i}) a")
    return self.colourLink_element
  end

  def sizeOption (i)
    self.class.div(:size, :css => ".product-cta option:nth-child(#{i})")
    return self.size_element
  end

  def scroll(element)
    $general.scroll(element,'.page.slider-item')
  end

end