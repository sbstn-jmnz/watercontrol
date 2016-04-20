require 'test_helper'

class CreatingMeasuresTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
  end

  test 'Debe retornar una lista de las mediciones pendientes de sus sectores asignados' do
    measure_process = FactoryGirl.create(:measure_process)
    sectors = []
    sector = FactoryGirl.create(:sector)
    sector2 = FactoryGirl.create(:sector_2, user_id: sector.user_id)
    sectors += [sector, sector2]

    get "/mobileapp/users/#{sector.user_id}/sectors", {}, create_headers

    assert_equal 200, response.status
    refute_empty response.body

  end

  test 'Deberia actualizar una medicion del proceso actual y cambiar el estado' do
    meter = FactoryGirl::create :meter
    meter_two = FactoryGirl::create :meter_two
    process = FactoryGirl::create :measure_process
    user = FactoryGirl::create :user
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
