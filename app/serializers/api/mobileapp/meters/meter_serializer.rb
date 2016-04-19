module Api::Mobile::Meters
  class MeterSerializer < ActiveModel::Serializer
    attributes :id, :number, :status, :last_measure
    has_many :measures, serializer: Api::Mobileapp::Measures::MeasureSerializer
  end
end
