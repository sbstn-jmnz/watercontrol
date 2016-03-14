require 'test_helper'

class ListinCondosTest < ActionDispatch::IntegrationTest
  setup { host! 'api.watercontrol-dev.com'}

  test 'retuns list of all condos' do
    get '/webapp/condos'
    assert_equal 200, response.status
    refute_empty response.body
  end

end
