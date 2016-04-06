require 'test_helper'

class CreatingMeasuresTest < ActionDispatch::IntegrationTest

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
