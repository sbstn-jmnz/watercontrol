require 'test_helper'

class UpdateAdminTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
  end

    test "Should update new password" do
       admin =  create(:admin,  email: 'test@test.cl', name: 'florencio', password: 'secretcodead1', role: Admin::ROLE.first )
       adminHash = { :admin => { password: '11232342345' } }
       put "/webapp/admins/#{admin.id}", adminHash.to_json, create_headers
       assert_equal Admin.find(admin.id).password, Digest::MD5.hexdigest(adminHash[:admin][:password])
    end
end
