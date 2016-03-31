require 'test_helper'

class ListingCondosTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
    @user = User.create!
  end
  condo = FactoryGirl::build_stubbed :condo

  test 'Retorna una lista todos los condominios' do
    get '/webapp/condos', {}, {'Authorization' => token_header(@user.auth_token)}
    assert_equal 200, response.status
    refute_empty response.body
    assert_equal Condo.count, json(response.body).count

  end

  test 'Retorna un condominio en particular con todas sus parcelas' do
    condo = FactoryGirl::create :Condotwo
    get "/webapp/condos/#{condo.id}", {}, {'Authorization' => token_header(@user.auth_token)}
    assert_equal 200, response.status
  end

end
