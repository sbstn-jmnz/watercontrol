class Sector < ActiveRecord::Base
  has_many :plots
  belongs_to :condo
  belongs_to :user
end
