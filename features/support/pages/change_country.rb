# Encoding: utf-8

class Change_country
  include PageObject

  link(:countryCta, :css => 'a.js-btn-country em')
  select_list(:country, :css => '.js-form select')
  link(:doneCTA, :title => 'Done')

 end