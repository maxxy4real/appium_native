class Scarfbar_pdp
  include PageObject

  div(:monogrammingCell, :css => '')
  div(:storytellingCell, :css => '')
  div(:plpCell, :css => '')
  div(:selectedColour, :css => '')

  def carouselColour (i)

  end

  def visibleColours
    carouselLeft=$browser.find_element(:css, '.js-colour-carousel-container').location.x
    carouselRight=$browser.find_element(:css, '.js-colour-carousel-container').location.x+$browser.find_element(:css, '.js-colour-carousel-container').size.width
    cols=Array.new
    i=1
    #For each image in the carousel, check image position is within the bounds of the carousel
    while self.carouselColour(i).visible?
      imagePos=$browser.find_element(:css, ".js-carousel-container li:nth-child(#{i})").location.x
      if imagePos.between?(carouselLeft,carouselRight)
        cols.push(i)
      end
      i+=1
    end
    return cols
  end
end