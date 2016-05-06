require 'test_helper'

class UpdatePlots < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
    @condo = FactoryGirl::create :condo
    @sector = FactoryGirl::create :sector, condo_id: @condo.id
    @plot = FactoryGirl::create :plot, sector_id: @sector.id
  end

  test 'Debe traer lista de parcelas por condominio' do
    get "/webapp/condos/#{@condo.id}/plots",{},create_headers

    assert_equal 201, response.status
    assert_equal @condo.plots.count, json(response.body).count

  end

  test 'actualizar los datos relacionados con el plot' do
    put "/webapp/condos/#{@condo.id}/plots/#{@plot.id}",{},create_headers

    assert_equal 204, response.status
  end

end
