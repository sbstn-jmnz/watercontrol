class Measure < ActiveRecord::Base
  STATUS = %w{ pending absent ok }

  belongs_to :meter
  belongs_to :user
  belongs_to :measure_process

  validates :value, presence: true
  validates :value, numericality: { only_integer: true }
  validates_associated :meter
  validate :value_should_be_greater_than_last_measure

  def value_should_be_greater_than_last_measure
    if Measure.where(meter_id: meter_id).count > 0
      if value.present? && value <= Measure.where(meter_id: meter_id).last.value
         errors.add(:value, "lower than previous")
      end
    end
  end

end
