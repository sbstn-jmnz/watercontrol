module Api::Mobileapp::Sectors
 class SectorSerializer < ActiveModel::Serializer
  attributes :id, :name
  belongs_to :condo_id
  has_many :plots, serializer: Api::Mobileapp::Plots::CondosPlotSerializer, root: false

  def plots
    plots_with_active_meters = []
    sold_plots = object.plots.where(status: Plot::STATUS.first)

    sold_plots.each do |plot|
      if plot.meters.where(status: Meter::STATUS.first).count > 0
        plots_with_active_meters.push plot
      end
    end
    return plots_with_active_meters
  end
 end
end
