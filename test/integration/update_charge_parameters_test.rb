require 'test_helper'

class UpdateChargeParametersTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
    @user = FactoryGirl::create :user
  end

  charge_parameters = FactoryGirl::create :charge_parameter

  test 'Actualiza parametros de cobro por condominio' do
    charge_parameters_hash = {
        fixed: 500,
        normal_price: 100,
        over_consumption_price: 150,
        }

    patch "/webapp/condos/#{charge_parameters.condo_id}/charge_parameters/update", charge_parameters_hash.to_json, create_headers

    assert_equal 200, response.status
    refute_empty response.body

  end

end
