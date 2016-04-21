module Api::Webapp::Meters
  class MeterMeasuresSerializer < ActiveModel::Serializer
    attributes :id, :number, :status, :measures
    has_many :measures, serializer: Api::Webapp::Measures::MeasureSerializer
  end
end
