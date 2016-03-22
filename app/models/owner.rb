class Owner < ActiveRecord::Base
  validates :name, :rut, presence: true
  has_many :plots

end
