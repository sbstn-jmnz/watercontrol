require 'test_helper'

class CreateMeterTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
    @condo = create :condo
    @sector = create :sector, condo_id: @condo.id
    @owner = create :owner
    @plot = create :plot, owner_id: @owner.id, sector_id: @sector.id
  end

    test "Should list all owners of the condo" do
       post "/webapp/condos/#{@condo.id}/owners", {
         owner:
         { idCorrentista: 2,
           name: 'Nombre de prueba',
           rut: '15346789-3'
         }
        }.to_json, create_headers
       owner = json(response.body)
       assert_equal 201, response.status
       assert_equal api_condo_owner_url(owner[:id], @condo.id), response.location
    end

    test 'should create a owner' do

    end
end
