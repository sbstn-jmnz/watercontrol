class Measure < ActiveRecord::Base
  STATUS = %w{ pending absent ok }
  
  belongs_to :meter
  belongs_to :user
  belongs_to :measure_process

  validates :value, presence: true
  validates :value, numericality: { only_integer: true }
  validates_associated :meter
end
