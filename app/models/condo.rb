class Condo < ActiveRecord::Base
  has_many :plots, through: :sectors
  has_many :sectors
  validates :name, :description, presence: true

end
