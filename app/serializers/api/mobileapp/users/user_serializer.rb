module Api::Mobileapp::Users
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :description
    has_many :sectors, serializer: Api::Mobileapp::Sectors::SectorSerializer

  end
end
