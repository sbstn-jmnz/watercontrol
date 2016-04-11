require 'test_helper'

class ListingMeasuresTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
  end


  test 'deberia retornar una lista todos las mediciones de un medidor' do

    measure = FactoryGirl::create :measure
    measure_two = FactoryGirl::create :measure_two

    get "/webapp/meters/#{measure.meter.id}", {}, create_headers

    assert_equal 200, response.status
    refute_empty response.body
    assert_equal Meter.find(measure.meter.id).measures.count, json(response.body)[:measures].count

  end

end
