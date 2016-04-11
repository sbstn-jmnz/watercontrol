class Condo < ActiveRecord::Base
  has_many :sectors
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
