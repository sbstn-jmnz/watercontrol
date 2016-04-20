module Api::Mobileapp::Meters
  class MeterSerializer < ActiveModel::Serializer
    attributes :id, :number, :status, :measure
    #has_many :measures, serializer: Api::Mobileapp::Measures::MeasureSerializer
def measure
  id_measure_process = MeasureProcess.where(status: 'active').take.id
  Measure.where(measure_process_id: id_measure_process, meter_id: object.id )
end
  end
end
