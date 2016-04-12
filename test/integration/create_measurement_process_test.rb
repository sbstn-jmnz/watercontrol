require 'test_helper'

class CreateMeasurementProcess < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
  end

  test 'Debe crear una medicion por cada medidor del condominio en estado pendiente' do
    condo = FactoryGirl::create :condo
    charge = FactoryGirl::create :charge_parameter
    post "/webapp/condos/#{condo.id}/measure_processes",{},create_headers
    assert_equal 201, response.status
    assert_equal Measure.where(measure_process_id: json(response.body)[:process_id], status: 'pending').count, condo.meters.count

  end

  test 'Debe cerrar el proceso de medicion' do
    condo = FactoryGirl::create :condo
    process = FactoryGirl::create :measure_process

    post "/webapp/condos/#{condo.id}/measure_processes/#{process.id}/close",{},create_headers

    assert_equal 204, response.status
    assert_equal MeasureProcess.find(process.id).status, MeasureProcess::STATUS.second

  end

  test 'No debe crear proceso si hay uno pendiente' do

  end


end
