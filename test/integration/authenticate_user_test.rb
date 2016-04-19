require 'test_helper'

class CreatingUsersTest < ActionDispatch::IntegrationTest

  setup do
  host! 'api.watercontrol-dev.com'
  @user = FactoryGirl::create :user
  end

  test 'valid authentication with token' do
    get '/webapp/condos', {}, {'Authorization' => token_header(@user.auth_token)}
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test 'invalid authentication' do
    get '/webapp/condos', {}, {'Authorization' => '@user.auth_token' + 'fake'}
    assert_equal 401, response.status
  end

  test 'sign_in_user' do
    post '/mobileapp/sessions',{ email: @user.email, password: 'secretcode' }.to_json, {'Accept' => Mime::JSON,
      'Content-Type'=> Mime::JSON.to_s}
    assert_equal 201, response.status
  end

  test 'sign_in_admin' do
    admin = FactoryGirl::create :admin
    post '/webapp/sessions',{ email: admin.email, password: 'secretcodeadmin' }.to_json, {'Accept' => Mime::JSON,
      'Content-Type'=> Mime::JSON.to_s}
    assert_equal 201, response.status
  end

end
