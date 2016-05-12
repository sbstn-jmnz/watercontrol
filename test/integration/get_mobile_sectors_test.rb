require 'test_helper'

class GetMobileSectorsTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
    @measure_process_closed = create(:measure_process, status: 'closed')
    @measure_process = create(:measure_process); 

    @user = create(:user)
    
    @sector = create(:sector, user_id: @user.id);
    @sector2 = create(:sector_2, user_id: @user.id)
    
    @plot = create(:plot, sector_id: @sector.id); 
    @plot2 = create(:plot, sector_id: @sector2.id)
    
    @meter = create(:meter, plot_id: @plot.id); 
    @meter2 = create(:meter, plot_id: @plot2.id)
    
    @last_measure = create(:measure, meter_id: @meter.id, user_id: @user.id, measure_process_id: @measure_process_closed.id,
                      status: 'ok',  value: 100)
    @last_measure2 = create(:measure, meter_id: @meter2.id, user_id: @user.id, measure_process_id: @measure_process_closed.id,
                      status: 'ok',  value: 101)
    @measure = create(:measure_from_admin, meter_id: @meter.id, user_id: @user.id, measure_process_id: @measure_process.id,
                      status: 'pending',  value: 0)
    @measure2 = create(:measure_from_admin, meter_id: @meter2.id, user_id: @user.id, measure_process_id: @measure_process.id,
                      status: 'pending', value: 0)
  end

  test 'Debe obtener una lista de sectores con su parcelas, medidores y mediciones' do
    
    get "/mobileapp/users/#{@user.id}/sectors",{},create_headers

    assert_equal 200, response.status
    assert_equal json(response.body)[:sectors].count, @user.sectors.to_a.count

  end

  test 'Debe enviar un mensaje indicando que no existen procesos activos' do
    
    MeasureProcess.all.each do |process|
      process.status = 'closed'
      process.save
    end

    get "/mobileapp/users/#{@user.id}/sectors",{},create_headers

    assert_equal 422, response.status
    assert_equal json(response.body)[:message], 'No Measure Proccess found'


  end


end
