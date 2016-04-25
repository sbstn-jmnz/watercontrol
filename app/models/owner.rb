class Owner < ActiveRecord::Base
  validates :name, :rut, presence: true
  has_many :plots
  has_many :invoices
  has_one :accountholder, foreign_key: :idCorrentista, class_name: :AccountHolder
end
