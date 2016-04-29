class Measure < ActiveRecord::Base
  STATUS = %w{ pending absent ok }

  belongs_to :meter
  belongs_to :user
  belongs_to :measure_process

  validates :value, presence: true
  validates :value, numericality: { only_integer: true }
  validates_associated :meter
  validate :value_should_be_greater_than_last_measure

 #This method ensure that pending measures get the last measure value, so it's
 #never 0
  def self.close_process(process_id)
    Measure.where(measure_process_id: process_id, status: STATUS.first).each do |measure|
      measure.update_columns(value: Measure.where(meter_id: measure.meter_id, status: STATUS.third).last.value)
    end
  end

  def value_should_be_greater_than_last_measure
    if Measure.where(meter_id: meter_id).count > 0
      if value.present? && value <= Measure.where(meter_id: meter_id).last.value
         errors.add(:value, "lower than previous")
      end
    end
  end

end
