module Api::Webapp::Admins
  class AdminSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :auth_token
    
    def auth_token
    	object.auth_token
    end
  end
end
