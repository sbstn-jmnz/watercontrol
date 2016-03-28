class Measure < ActiveRecord::Base
  belongs_to :meter
  belongs_to :user
  
  validates :value, presence: true
  validates :value, numericality: { only_integer: true }
  validates_associated :meter
end
