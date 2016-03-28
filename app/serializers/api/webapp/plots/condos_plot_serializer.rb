module Api::Webapp::Plots
  class CondosPlotSerializer < ActiveModel::Serializer
    attributes :id, :plot_number, :owner
    belongs_to :sector_id
    belongs_to :owner_id
    has_one :owner
    has_many :meters, serializer: Meters::MeterSerializer

    def owner
      object.owner.name
    end

  end
end
