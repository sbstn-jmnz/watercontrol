module Api::Webapp::Meters
  class MeterSerializer < ActiveModel::Serializer
    attributes :id, :number, :state
    belongs_to :plot_id
    has_many :measures, serializer: Measures::MeasureSerializer
  end
end
