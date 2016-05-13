require 'test_helper'

class UpdatePlots < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
    @owner = create :owner
    @condo = FactoryGirl::create :condo
    @sector = FactoryGirl::create :sector, condo_id: @condo.id
    @plot = FactoryGirl::create :plot, sector_id: @sector.id, status: Plot::STATUS.first
  end

  test 'Debe traer lista de parcelas por condominio' do
    get "/webapp/condos/#{@condo.id}/plots",{},create_headers

    assert_equal 201, response.status
    assert_equal @condo.plots.count, json(response.body).count

  end

  test 'actualizar los datos relacionados con el plot' do
    put "/webapp/condos/#{@condo.id}/plots/#{@plot.id}",{ plot:
                            { plot_number: '1223423',
                              status: Plot::STATUS.second,
                              sector: @sector.id,
                              owner_id: @owner.id
                            }
                          }.to_json,create_headers

    assert_equal 'available', Plot.find(@plot.id).status
  end

end
