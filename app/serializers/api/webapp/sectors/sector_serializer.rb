module Api::Webapp::Sectors
class SectorSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :condo_id
  has_many :plots, serializer: Plots::PlotSerializer
  end
end
