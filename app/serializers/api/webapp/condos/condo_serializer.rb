module Api::Webapp::Condos
  class CondoSerializer < ActiveModel::Serializer
    attributes :id, :name, :description
    has_many :sectors, serializer: Api::Webapp::Sectors::SectorSerializer

  end
end
