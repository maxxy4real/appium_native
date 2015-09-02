# Encoding: utf-8

class Change_language
  include PageObject

  div(:html, :css => 'html')
  link(:languageCta, :css => '.js-btn-language em')
  div(:slate, :css => '.js-slate-content.changelanguage')
  div(:slateContent, :css => '.js-slate-content')
  select(:option, :css => '.filter-list .label')
  link(:language, :css => '.filter-list')
  select(:current, :css => '.filter-list .icn-tick')
  button(:doneBtn, :css => '.js-toolbar-right .btn.btngrp-1')
  div(:current, :css => '.filter-list .icn-tick')
  link(:deutsch, :xpath => '//span[text()="Deutsch"]')

  def language_tick (position)
    self.class.select(:tick, :css => ".filter-list li:nth-child(#{position}) .icn-tick")
    return self.tick_element
  end

  def find_language_tick
    i=1
    while self.language_by_position(i).exists?
      if self.language_tick(i).exists?
        break
      end
      i+=1
    end
    return i
  end

  def language_by_position (position)
    self.class.link(:language, :css => ".js-slate-content.changelanguage>ul>li:nth-child(#{position})")
    return self.language_element
  end
  
  def language_from_list (language)
    self.class.link(:language, :xpath => "//span[contains(text(),\'#{language}'\)]")
    return self.language_element
  end

 end