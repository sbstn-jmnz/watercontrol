module Api::Mobileapp::Users
  class UserSerializer < ActiveModel::Serializer
    #attributes :id, :name
    has_many :sectors, serializer: Api::Mobileapp::Sectors::SectorSerializer, root: false
  end
end
