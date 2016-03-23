class Condo < ActiveRecord::Base
  has_many :sectors
  validates :name, :description, presence: true

end
