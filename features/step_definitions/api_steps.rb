
Given /^I sign in via API as a (.*?) user$/ do |user|
    @api_login = Api_login.post('/auth/as/token.oauth2',
    query: {username: @users.css("#{user} email #{$session}").text,
    password: @users.css("#{user} password").text})
    assert @api_login.code == 200, 'Unsuccessful Login'
    # following to be used for further tests after login
    $api_token = @api_login['access_token']
end


Then /^the user bag is emptied$/ do
  @bag_content = Api_bag.get('/',
    query: {token: $api_token})
  @wait.until {@bag_content.code == 200}

  #iterates through returned json, each item being a data module
  @data_size = @bag_content['response']['data'].size

  if @data_size > 0
    @bag_content['response']['data'].each do |data|
      # puts data['id']
      @product = data['id']
      @delete_job = Api_bag.delete('/' + @product,
        query: {token: $api_token})
      @wait.until {@delete_job.code == 200}
    end
  end

  #retrieves bag json again, json shouldnt contain any item data
  @updated_bag = Api_bag.get('/',
    query: {token: $api_token})
  @data_size = @updated_bag['response']['data'].size
  assert @data_size == 0, 'Bag is not empty'
end