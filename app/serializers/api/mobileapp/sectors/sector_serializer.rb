module Api::Mobileapp::Sectors
class SectorSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :condo_id
  has_many :plots, serializer: Api::Mobileapp::Plots::CondosPlotSerializer, root: false
  end
end
