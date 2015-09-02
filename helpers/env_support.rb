require 'yaml'

#TEST_ENV can be set at command line, defaults to local, can have dev, qa, uat, pre_prod, prod
ENV['TEST_ENV'] ||= 'local'
BASE_URL = YAML.load_file(".config/cucumber.yaml")[ENV['TEST_ENV']][:site_url]
API_URL = YAML.load_file(".config/cucumber.yaml")[ENV['TEST_ENV']][:api_url]
V_ID = YAML.load_file(".config/cucumber.yaml")[ENV['TEST_ENV']][:validator_id]
C_ID = YAML.load_file(".config/cucumber.yaml")[ENV['TEST_ENV']][:client_id]
C_SECRET = YAML.load_file(".config/cucumber.yaml")[ENV['TEST_ENV']][:client_secret]
