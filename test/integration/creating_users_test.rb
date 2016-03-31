require 'test_helper'

class CreatingUsersTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
    user = User.create!
  end
  test 'creates user' do
    post '/webapp/users', { user:
                     { name: 'User One', rut: '15.316.349-9'}}.to_json,
                     { 'Accept' => Mime::JSON, 'Content-Type'=> Mime::JSON.to_s,
                     'Authorization' => token_header(@user.auth_token)}

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    user = json(response.body)

    assert_equal api_user_url(user[:id]), response.location
  end

  test 'list users' do

    get '/webapp/users',{},{'Authorization' => token_header(@user.auth_token)}
      assert_equal 200, response.status
      refute_empty response.body
      assert_equal User.count, json(response.body).count
    end

  test 'Retorna un usuario en particular con todas sus parcelas' do
       user = FactoryGirl::create :user
       get "/webapp/users/#{user.id}",{},'Authorization' => token_header(@user.auth_token)
       assert_equal 200, response.status
  end

end
