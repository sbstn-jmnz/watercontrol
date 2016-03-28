module Api::Webapp::Users
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :name
    has_many :measures
    
  end
end
