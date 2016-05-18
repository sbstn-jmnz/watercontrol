require 'test_helper'

class CreateMeterTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
    @plot = create :plot
  end

    test "Should create new meter" do
       post "/webapp/meters", { meter:
                               { number: '1223423',
                                 status: Meter::STATUS.first,
                                 plot_id: @plot.id
                               }
                             }.to_json, create_headers
       meter = json(response.body)
       assert_equal api_meter_url(meter[:id]), response.location
       assert_equal 201, response.status
    end
end
