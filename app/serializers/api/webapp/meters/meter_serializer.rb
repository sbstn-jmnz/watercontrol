module Api::Webapp::Meters
  class MeterSerializer < ActiveModel::Serializer
    attributes :id, :number, :status, :last_measure
    belongs_to :plot_id

    def last_measure
      object.last_measure
    end

  end
end
