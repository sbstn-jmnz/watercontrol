module Api::Webapp::Plots
  class PlotSerializer < ActiveModel::Serializer
    attributes :id, :plot_number
    belongs_to :sector_id
    has_many :meters, serializer: Meters::MeterSerializer
  end
end
