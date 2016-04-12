class ChargeParameter < ActiveRecord::Base
  belongs_to :condo
  validates :fixed, :normal_price, :over_consumption_price, presence: true
  validates :fixed, :normal_price, :over_consumption_price, numericality: { :greater_than_or_equal_to => 0 }
end
