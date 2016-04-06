require 'test_helper'

class CreatingMeasuresTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
  end


  test 'creates measures' do
    meter = FactoryGirl::build_stubbed :meter
    measureHash = { 
      # measure: {
        value: 100,
        comment: 'Medición mes mayo',
        status: MEASURES_STATUS.first,
        meter_id: meter.id
      # },
    }

    post '/webapp/measures', measureHash.to_json, create_headers
                     
    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    user = json(response.body)

    assert_equal api_measure_url(user[:id]), response.location
  end
end
