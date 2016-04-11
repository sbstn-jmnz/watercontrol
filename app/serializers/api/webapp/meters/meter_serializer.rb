module Api::Webapp::Meters
  class MeterSerializer < ActiveModel::Serializer
    attributes :id, :number, :status, :last_measure
    has_many :measures, serializer: Api::Webapp::Measures::MeasureSerializer
  end
end
