class Condo < ActiveRecord::Base
  has_one :charge_parameter
  has_many :sectors
  has_many :users, -> { uniq }, through: :sectors
  has_many :plots, -> { uniq }, through: :sectors
  has_many :admins, -> { uniq }, through: :admins_condo
  has_many :admins_condo
  validates :name, :description, presence: true

  def meters
    meters = []
    sectors.each do |sector|
      sector.plots.where(status: Plot::STATUS.first).each do |plot|
        plot.meters.where(status: Meter::STATUS.first).each do |meter|
          meters.push meter
        end
      end
    end
    return meters
  end

end
