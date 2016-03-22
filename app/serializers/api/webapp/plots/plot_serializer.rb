
module Api::Webapp::Plots
class PlotSerializer < ActiveModel::Serializer
  attributes :id, :plot_number
  belongs_to :condo_id
  has_many :meters

  end
end
