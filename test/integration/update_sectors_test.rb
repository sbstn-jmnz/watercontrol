require 'test_helper'

class UpdateSectorTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
    @user = FactoryGirl::create :user
    @user2 = FactoryGirl::create(:user, name: "Luis Felipe")
    @sector = FactoryGirl::create(:sector, user_id: @user.id)
    @sector2 = FactoryGirl::create(:sector, user_id: @user2.id)
  end

  test 'Retorna una lista todos los condominios' do

  end

  test 'Solicitud mal hecha' do
    sectorHash = {
      :sectors => [{
        id: @sector.id,
        user_id:
        },
      {
        id: @sector2.id,
        user_id: @user2.id
      }]
    }
    put "/webapp/sectors", sectorHash.to_json, create_headers
    assert_equal 422, response.status
  end

end
