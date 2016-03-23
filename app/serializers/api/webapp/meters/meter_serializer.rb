module Api::Webapp::Meters
  class MeterSerializer < ActiveModel::Serializer
    attributes :id, :number, :state, :last_measure, :last_measurer
    belongs_to :plot_id

    def last_measure
      object.last_measure
    end

    def last_measurer
      object.last_measurer
    end
  end
end
