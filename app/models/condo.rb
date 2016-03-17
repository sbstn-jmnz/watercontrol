class Condo < ActiveRecord::Base
  has_many :plots
  validates :name, :description, presence: true

  def with_plots
    include plots
  end

end
