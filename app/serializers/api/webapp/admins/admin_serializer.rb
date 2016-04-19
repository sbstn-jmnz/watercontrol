module Api::Webapp::Admins
  class AdminSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :auth_token, :condos_assigned

    def condos_assigned
      object.condos
    end

    def auth_token
    	object.auth_token
    end
  end
end
