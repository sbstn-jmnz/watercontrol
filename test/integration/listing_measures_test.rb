require 'test_helper'

class ListingMeasuresTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
  end
 

  test 'deberia retornar una lista todos las mediciones de un medidor' do
    
    plot = FactoryGirl::create :plot_one
    meter = FactoryGirl::create :meter

    get "/webapp/meters/#{meter.id}", {}, create_headers

    puts json(response.body)

    assert_equal 200, response.status
    refute_empty response.body
    # assert_equal Measure.where(meter_id: meter.id).count, json(response.body).count

  end

end
