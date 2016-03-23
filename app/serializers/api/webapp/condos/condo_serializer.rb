module Api::Webapp::Condos
  class CondoSerializer < ActiveModel::Serializer
    attributes :id, :name, :description
    has_many :sectors, serializer: Sectors::SectorSerializer

  end
end
