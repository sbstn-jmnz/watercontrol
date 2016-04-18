class Condo < ActiveRecord::Base
  has_one :charge_parameter
  has_many :sectors
  belongs_to :admin
  validates :name, :description, presence: true


  def meters
    meters = []
    sectors.each do |sector|
      sector.plots.each do |plot|
        plot.meters.each do |meter|
          meters.push meter
        end
      end
    end
    return meters
  end

end
