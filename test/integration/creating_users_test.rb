require 'test_helper'

class CreatingUsersTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
    @user = FactoryGirl::create :user
    @condo = FactoryGirl::create :condo
    @sector = create(:sector, user_id: @user.id, condo_id: @condo.id)
    @condo_id = @user.sectors.first.condo_id
  end
  
  test 'creates user with email and password' do

    post "/webapp/condos/#{@condo_id}/users", { user:
                            { name: 'User One',
                              rut: '15.316.349-9',
                              password: 'password',
                              password_confirm: 'password',
                              email: 'info@mastertool.cl'
                              }
                          }.to_json,#--end of data post parameter--
                          { 'Accept' => Mime::JSON,
                            'Content-Type'=> Mime::JSON.to_s,
                            'Authorization' => token_header(@user.auth_token)
                          }#--end of headers--rake

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    user = json(response.body)

    assert_equal api_user_url(user[:id]), response.location
  end

  test 'list users' do
    get "/webapp/condos/#{@condo_id}/users",{},{'Authorization' => token_header(@user.auth_token)}
      assert_equal 200, response.status
      refute_empty response.body
      assert_equal @condo.users.count, json(response.body).count
    end

  test 'Retorna un usuario en particular con todas sus parcelas' do
       get "/webapp/condos/#{@condo_id}/users/#{@user.id}",{},'Authorization' => token_header(@user.auth_token)
       assert_equal 200, response.status
  end

end
