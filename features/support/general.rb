class General
  def initialize(wait)
    @wait = wait
  end
  
  def scroll(*args)
    element=args[0]
    if args.size == 1
      scrollable='.page'
    else
      scrollable=args[1]
    end
    if $browser.capabilities.browser_name == 'Safari' || $browser.capabilities.browser_name == 'safari' || $browser.capabilities.browser_name == 'iOS'
      $browser.execute_script("if (document.readyState === 'complete'){document.querySelector('#{scrollable}').scrollTop = 0;}")
      px = element.location.y - element.size.height - 100
      $browser.execute_script("if (document.readyState === 'complete'){document.querySelector('#{scrollable}').scrollTop = #{px};}")
      sleep 1
    else
      @wait.until {element.exists?}
      element.scroll_into_view
    end
    sleep 1
  end

  def scrollRight(element, px)
    # If the device has a touch interface, appium's swipe method is used, otherwise a standard javascript scroll is
    if $browser_type.include? 'touch'
      # element parameter is just string selector, so it can be used with javascript in the non-touch step below
      el = element
      start = (el.location.x + el.size.width - 10)
      y = el.location.y + (el.size.height/2)
      # Android NATIVE_APP context seems to be roughly 1.5x larger than WEBVIEW_1, so this accounts for that. Extra 250 accounts for the menu bar at the top of the browser
      if $browser_name.eql? 'Android'
        start=start*1.5
        y=(y+250)*1.5
        px=px*1.5
      end
      finish = start - px
      opts = {
          :start_x => start, :start_y => y, :end_x => finish, :end_y => y, :touchCount => 1, :duration => 500
      }
      # Have to switch to NATIVE_APP context in order to perform the swipe
      $appium.set_context "NATIVE_APP"
      begin
        Appium::TouchAction.new.swipe(opts).perform
      rescue Selenium::WebDriver::Error::JavascriptError
        puts "Failed to scroll. Coordinates out of bounds"
      end
      # Switch back to webview
      $appium.set_context "WEBVIEW_1"
    else
      $browser.execute_script("if (document.readyState === 'complete'){arguments[0].scrollLeft = #{px};}", element)
    end
    sleep 1
  end

  def scrollLeft(element, px)
    # If the device has a touch interface, appium's swipe method is used, otherwise a standard javascript scroll is
    if $browser_type.include? 'touch'
      # element parameter is just string selector, so it can be used with javascript in the non-touch step below
      el = $browser.find_element(:css, element)
      start = (el.location.x + 10)
      y = el.location.y + (el.size.height/2)
      # Android NATIVE_APP context seems to be rouchly 1.5x larger than WEBVIEW_1, so this accounts for that. Extra 250 accounts for the menu bar at the top of the browser
      if $browser_name.eql? 'Android'
        start=start*1.5
        y=(y+250)*1.5
        px=px*1.5
      end
      finish = start + px
      opts = {
          :start_x => start, :start_y => y, :end_x => finish, :end_y => y, :touchCount => 1, :duration => 500
      }
      # Have to switch to NATIVE_APP context in order to perform the swipe
      $appium.set_context "NATIVE_APP"
      begin
        Appium::TouchAction.new.swipe(opts).perform
      rescue Selenium::WebDriver::Error::JavascriptError
        puts "Failed to scroll. Coordinates out of bounds"
      end
      # Switch back to webview
      $appium.set_context "WEBVIEW_1"
    else
      $browser.execute_script("if (document.readyState === 'complete'){document.querySelector('#{element}').scrollLeft = #{px};}")
    end
    sleep 1
  end

  def number_to_word(number)
    if number.class.name.eql? "Fixnum"
      numbers = {
        1=>'one',
        2=>'two'
      }
      $session = numbers[number]
    end
  end

end