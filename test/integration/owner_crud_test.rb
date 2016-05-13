require 'test_helper'

class CreateMeterTest < ActionDispatch::IntegrationTest

  setup do
    host! 'api.watercontrol-dev.com'
    @condo = create :condo
    @sector = create :sector, condo_id: @condo.id
    @owner = create :owner
    @plot = create :plot, owner_id: @owner.id, sector_id: @sector.id
  end

    test "create an owner of the condo" do
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
    test "should not create an owner of the condo if not complete" do
       post "/webapp/condos/#{@condo.id}/owners", {
         owner:
         { idCorrentista: 2,
           name: 'Nombre de prueba',
           rut: nil
         }
        }.to_json, create_headers

       assert_equal 422, response.status
  end

    test 'should show a list of  owners from condo' do
      get "/webapp/condos/#{@condo.id}/owners", {}, create_headers

      assert_equal 200, response.status
      refute_empty response.body

    end

    test "should show a owner" do
        get "/webapp/condos/#{@condo.id}/owners/#{@owner.id}", {}, create_headers

        assert_equal 200, response.status
        owner = json(response.body)
        assert_equal @owner.name, owner[:name]
    end
end
