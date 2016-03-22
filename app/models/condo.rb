class Condo < ActiveRecord::Base
  has_many :plots
  validates :name, :description, presence: true

end
