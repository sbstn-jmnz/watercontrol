require 'test_helper'

class ListingMeasuresTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
  end


  test 'deberia retornar una lista todos las mediciones de un medidor' do
    meter = create :meter
    user = create :user
    measure = create(:measure, meter_id: meter.id, user_id: user.id, value: 100)
    measure_two = create(:measure_two, meter_id: meter.id, user_id: user.id, value: 105)

    get "/webapp/meters/#{measure.meter.id}", {}, create_headers

    assert_equal 200, response.status
    refute_empty response.body
    assert_equal Meter.find(measure.meter.id).measures.count, json(response.body)[:measures].count

  end

end
