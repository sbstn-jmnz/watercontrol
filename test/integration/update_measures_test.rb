require 'test_helper'

class UpdateMeasuresTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
    @measure_process = create(:measure_process); @user = create(:user)
    @sector = create(:sector, user_id: @user.id); @sector2 = create(:sector_2, user_id: @user.id)
    @plot = create(:plot, sector_id: @sector.id); @plot2 = create(:plot, sector_id: @sector2.id)
    @meter = create(:meter, plot_id: @plot.id); @meter2 = create(:meter, plot_id: @plot2.id)
    @measure = create(:measure, meter_id: @meter.id, user_id: @user.id, measure_process_id: @measure_process.id,
                      status: 'pending',  value: 0)
    @measure2 = create(:measure, meter_id: @meter2.id, user_id: @user.id, measure_process_id: @measure_process.id,
                      status: 'pending', value: 0)
  end

  test 'Debe retornar una lista de las mediciones pendientes de sus sectores asignados' do
    get "/mobileapp/users/#{@sector.user_id}/sectors", {}, create_headers
    assigned_sectors = json(response.body)
    assert_equal 200, response.status
    assert_equal assigned_sectors[:sectors][0][:plots][0][:meters][0][:measure][0][:status], 'pending'
    assert_equal assigned_sectors[:sectors][0][:plots][0][:meters][0][:measure][0][:value], 0
    refute_empty response.body
  end

  test 'Debe actualizar mediciones del proceso actual y cambiar estado' do

    measureHash = {
      :measures => [{
        id: @measure.id,
        comment: 'Medición mes mayo',
        value: 100,
        },
      {
        id: @measure2.id,
        comment: 'Medición mes mayo',
        value: 201,
      }]
    }

    put '/mobileapp/measures', measureHash.to_json, create_headers

    assert_equal 204, response.status
    assert_equal Measure.find(@measure.id).value, 100
    assert_equal Measure.find(@measure.id).status, 'ok'
    assert_equal Measure.find(@measure2.id).value, 201
    assert_equal Measure.find(@measure2.id).status, 'ok'
  end

end
