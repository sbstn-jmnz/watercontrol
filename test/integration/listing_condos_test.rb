require 'test_helper'

class ListinCondosTest < ActionDispatch::IntegrationTest
  setup { host! 'api.watercontrol-dev.com'}

  test 'Retorna una lista todos los condominios' do
    get '/webapp/condos'
    assert_equal 200, response.status
    refute_empty response.body
    assert_equal Condo.all.count, responde.body.count
  end

end
