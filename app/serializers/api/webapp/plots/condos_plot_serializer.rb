module Api::Webapp::Plots
  class CondosPlotSerializer < ActiveModel::Serializer
    attributes :id, :plot_number, :owner, :status
    belongs_to :sector_id
    belongs_to :owner_id
    has_one :owner
    has_many :meters, serializer: Api::Webapp::Meters::MeterSerializer

    def owner
      if object.status == Plot::STATUS.first
        object.owner.name
      else
        nil
      end
    end

  end
end
