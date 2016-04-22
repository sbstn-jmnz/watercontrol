require 'test_helper'

class UpdateSectorTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
    @user = FactoryGirl::create :user
    @user2 = FactoryGirl::create(:user, name: "Luis Felipe")
    @sector = FactoryGirl::create(:sector, user_id: @user.id)
    @sector2 = FactoryGirl::create(:sector, user_id: @user2.id)
  end

  test 'Retorna una lista todos los sectores del condominios' do
    get "/webapp/condos/#{@sector.condo_id}/sectors",{},create_headers
    assert_equal 200, response.status
  end

  test 'Solicitud mal hecha' do
    sectorHash = {:sectors => [{ id: nil, user_id: nil },
                               { id: @sector2.id, user_id: @user2.id }]}

    put "/webapp/condos/#{@sector.condo_id}/sectors", sectorHash.to_json, create_headers
    assert_equal 422, response.status
  end

end
