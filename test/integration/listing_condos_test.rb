require 'test_helper'

class ListinCondosTest < ActionDispatch::IntegrationTest

  setup { host! 'api.watercontrol-dev.com'}
  condo = FactoryGirl::build_stubbed :condo

  test 'Retorna una lista todos los condominios' do
    get '/webapp/condos'
    assert_equal 200, response.status
    refute_empty response.body
    assert_equal Condo.count, JSON.parse(response.body, symbolize_names: true).count
  end

  test 'Retorna un condominio en particular con todas sus parcelas' do
    condo = FactoryGirl::create :condo
    get "/webapp/condos/#{condo.id}"
    assert_equal 200, response.status
  end

end
