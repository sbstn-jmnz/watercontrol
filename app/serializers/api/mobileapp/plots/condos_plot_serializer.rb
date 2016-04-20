module Api::Mobileapp::Plots
  class CondosPlotSerializer < ActiveModel::Serializer
    attributes :id, :plot_number, :owner, :status
    belongs_to :sector_id
    belongs_to :owner_id
    has_one :owner
    has_many :meters, serializer: Api::Mobileapp::Meters::MeterSerializer

    def owner
      object.owner.name
    end

    def meters
      object.meters.where(status: Meter::STATUS.first)
    end
  end
end
