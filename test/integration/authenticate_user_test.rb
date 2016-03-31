require 'test_helper'

class CreatingUsersTest < ActionDispatch::IntegrationTest

  setup do
  host! 'api.watercontrol-dev.com'
  @user = User.create!
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

end
