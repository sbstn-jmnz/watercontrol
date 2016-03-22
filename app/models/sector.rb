class Sector < ActiveRecord::Base
  has_many :plots
  belongs_to :condo
end
