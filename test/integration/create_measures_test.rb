require 'test_helper'

class CreatingMeasuresTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
  end

  test 'Deberia registrar mediciones y obtener la ruta de acceso y un estado 201 como resultado' do

    meter = FactoryGirl::create :meter
    meter_two = FactoryGirl::create :meter_two
    process = FactoryGirl::create :measure_process
    user = FactoryGirl::create :user

    measureHash = {
      :measures => [{
        comment: 'Medición mes mayo',
        value: 100,
        status: Measure::STATUS.first,
        meter_id: meter.id,
        process_id: process.id,
        user_id: user.id
      },
      {
        comment: 'Medición mes mayo',
        value: 201,
        status: Measure::STATUS.first,
        meter_id: meter_two.id,
        process_id: process.id,
        user_id: user.id
      }]
    }

    post '/mobileapp/measures', measureHash.to_json, create_headers

    assert_equal 204, response.status
    
  end

end
