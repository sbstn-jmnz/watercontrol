require 'test_helper'

class ListingSectorsTest < ActionDispatch::IntegrationTest

  setup { host! 'api.watercontrol-dev.com'}
  sector = FactoryGirl::build_stubbed :sector
  condo = FactoryGirl::build_stubbed :condo

  test 'Retorna una lista todos los sectores por condominio' do
    get "/webapp/condos/#{condo.id}/sectors"

    assert_equal 200, response.status
    refute_empty response.body
    assert_equal Sector.where(condo_id: condo.id).count, json(response.body).count

  end

  test 'Retorna un sector en particular con todas sus parcelas' do
    get "/webapp/condos/#{condo.id}/sectors/#{sector.id}"

    assert_equal 200, response.status
    refute_empty response.body

  end

end
