class MeasureProcess < ActiveRecord::Base
  STATUS = %w{ active closed }
  has_many :measures
  
end
