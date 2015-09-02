require 'httparty'
require_relative 'env_support.rb'

class Api_login
    include HTTParty
    base_uri API_URL
    default_params grant_type: 'password', 
    			   validator_id: V_ID, 
    			   client_id: C_ID, 
    			   client_secret: C_SECRET
end

class Api_bag
    include HTTParty
    base_uri API_URL + '/apps/ecom/users/me/orders/current/items'
    default_params country: 'GB', 
    			   language: 'en'
end