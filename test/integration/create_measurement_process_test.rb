require 'test_helper'

class CreateMeasurementProcess < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
    @condo = create :condo
    @measure_process_closed = create(:measure_process, status: 'closed')
    @process = create(:measure_process)
    @user = create(:user)
    @sector = create(:sector, user_id: @user.id, :condo @condo.id)
    @plot = create(:plot, sector_id: @sector.id)
    @meter = create(:meter, plot_id: @plot.id)
    @last_measure = create(:measure, meter_id: @meter.id, user_id: @user.id, measure_process_id: @measure_process_closed.id,
                      status: 'ok',  value: 100)
    end

  test 'Debe crear una medicion por cada medidor del condominio en estado pendiente' do
    post "/webapp/condos/#{@condo.id}/measure_processes",{},create_headers

    assert_equal 201, response.status
    assert_equal Measure.where(measure_process_id: json(response.body)[:process_id], status: 'pending').count, @condo.meters.count

  end

  test 'Debe cerrar el proceso de medicion' do
    post "/webapp/condos/#{@condo.id}/measure_processes/#{@process.id}/close",{},create_headers

    assert_equal 204, response.status
    assert_equal MeasureProcess.find(@process.id).status, MeasureProcess::STATUS.second

  end

  test 'should show a list of proccess from condo' do
    get "/webapp/condos/#{@condo.id}/measure_processes", {}, create_headers

    assert_equal 200, response.status
    refute_empty response.body

  end
end
