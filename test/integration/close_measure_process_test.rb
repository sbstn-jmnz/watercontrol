require 'test_helper'

class CloseMeasureProcessTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'

    
    @user = create(:user)
    @measure_process = create(:measure_process)

    @condo = create(:condo)
    
    @sector = create(:sector, user_id: @user.id, condo_id: @condo.id)
    @sector2 = create(:sector_2, user_id: @user.id)
    
    @plot = create(:plot, sector_id: @sector.id)
    @plot2 = create(:plot, sector_id: @sector2.id)
    
    @meter = create(:meter, plot_id: @plot.id)
    @meter2 = create(:meter, plot_id: @plot2.id)
    
    @measure = create(:measure, meter_id: @meter.id, user_id: @user.id, measure_process_id: @measure_process.id,
                      status: 'pending',  value: 1026, updated_at: Time.now - 6.month)
    @measure2 = create(:measure, meter_id: @meter.id, user_id: @user.id, measure_process_id: @measure_process.id,
                      status: 'pending',  value: 1250, updated_at: Time.now - 5.month)
    @measure3 = create(:measure, meter_id: @meter.id, user_id: @user.id, measure_process_id: @measure_process.id,
                      status: 'pending',  value: 1410, updated_at: Time.now - 4.month)
    @measure4 = create(:measure, meter_id: @meter.id, user_id: @user.id, measure_process_id: @measure_process.id,
                      status: 'pending',  value: 1820, updated_at: Time.now - 3.month)
    @measure5 = create(:measure, meter_id: @meter.id, user_id: @user.id, measure_process_id: @measure_process.id,
                      status: 'pending',  value: 1900, updated_at: Time.now - 2.month)
    @measure6 = create(:measure, meter_id: @meter.id, user_id: @user.id, measure_process_id: @measure_process.id,
                      status: 'pending',  value: 2030, updated_at: Time.now - 1.month)

    @measure7 = create(:measure, meter_id: @meter.id, user_id: @user.id, measure_process_id: @measure_process.id,
                      status: 'pending',  value: 2090)

  end

  
  test 'close_a_process' do
    
    post "/webapp/condos/#{@condo.id}/measure_processes/#{@measure_process.id}/close",{}, create_headers
    assert_equal 204, response.status
  
  end

end
