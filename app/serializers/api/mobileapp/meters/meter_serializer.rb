module Api::Mobileapp::Meters
  class MeterSerializer < ActiveModel::Serializer
    attributes :id, :number, :status, :measure

    def measure
      id_measure_process = MeasureProcess.where(status: 'active').take.id
      Measure.where(measure_process_id: id_measure_process, meter_id: object.id ).take
    end
  end
end
