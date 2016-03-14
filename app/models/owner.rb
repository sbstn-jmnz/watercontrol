class Owner < ActiveRecord::Base
  validates :name, :rut, presence: true
end
