module Api::Webapp::Plots
  class PlotSerializer < ActiveModel::Serializer
    attributes :id, :plot_number, :owner, :meters
    belongs_to :sector_id
    belongs_to :owner_id
    has_one :owner
    has_many :meters

    def owner
      object.owner
    end

    def meters
      object.meters
    end

  end
end
