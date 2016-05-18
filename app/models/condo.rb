class Condo < ActiveRecord::Base
  has_many :plots
  validates :name, :description, presence: true

  def with_plots
    Condo.includes :plots
  end

  def active_model_serializer
    Condos::CondoSerializer
  end

end
