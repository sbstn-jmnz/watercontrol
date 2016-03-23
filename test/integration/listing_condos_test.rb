require 'test_helper'

class ListingCondosTest < ActionDispatch::IntegrationTest

  setup { host! 'api.watercontrol-dev.com'}
  condo = FactoryGirl::build_stubbed :condo

  test 'Retorna una lista todos los condominios' do
    get '/webapp/condos'

    assert_equal 200, response.status

    refute_empty response.body

    assert_equal Condo.count, json(response.body).count

  end

  test 'Retorna un condominio en particular con todas sus parcelas' do
    condo = FactoryGirl::create :Condotwo
    get "/webapp/condos/#{condo.id}"
    assert_equal 200, response.status
  end

end
