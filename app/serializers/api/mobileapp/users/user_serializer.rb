module Api::Mobileapp::Users
  class UserSerializer < ActiveModel::Serializer
    has_many :sectors, serializer: Api::Mobileapp::Sectors::SectorSerializer, root: false
  end
end
