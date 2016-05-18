require 'test_helper'

class CreateMeasurementProcess < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
    @condo = create :condo
    @measure_process_closed = create(:measure_process, status: 'closed')
    @process = create(:measure_process, status: 'closed')
    @user = create(:user)
    @owner = create (:owner)
    @sector = create(:sector, user_id: @user.id, condo_id: @condo.id)
    @plot = create(:plot, sector_id: @sector.id, owner_id: @owner.id)
    @meter = create(:meter, plot_id: @plot.id)
    @last_measure = create(:measure, meter_id: @meter.id, user_id: @user.id, measure_process_id: @measure_process_closed.id,
                      status: 'ok',  value: 100)
    @last_measure2 = create(:measure, meter_id: @meter.id, user_id: @user.id, measure_process_id: @measure_process_closed.id,
                      status: 'ok',  value: 150)
    end

  test 'Debe crear una medicion por cada medidor del condominio en estado pendiente' do
    post "/webapp/condos/#{@condo.id}/measure_processes",{},create_headers

    assert_equal 201, response.status
    assert_equal Measure.where(measure_process_id: json(response.body)[:process_id], status: 'pending').count, @condo.meters.count

  end

  test 'Debe cerrar el proceso de medicion' do
    @process.status = 'active'
    post "/webapp/condos/#{@condo.id}/measure_processes/#{@process.id}/close",{},create_headers

    assert_equal 204, response.status
    assert_equal MeasureProcess.find(@process.id).status, MeasureProcess::STATUS.second

  end

  test 'Should not create process is there is one active' do
    @process = create(:measure_process)
    post "/webapp/condos/#{@condo.id}/measure_processes",{},create_headers

    assert_equal 422, response.status

  end

  test 'should show a list of proccess from condo' do
    get "/webapp/condos/#{@condo.id}/measure_processes", {}, create_headers

    assert_equal 200, response.status
    refute_empty response.body
  end

  test 'should show a list of measures per proccess' do
    get "/webapp/condos/#{@condo.id}/measure_processes/#{@proccess.id}", {}, create_headers

    assert_equal 200, response.status
    refute_empty response.body
  end

end
