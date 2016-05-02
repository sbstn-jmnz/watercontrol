module Api::Webapp::Plots
  class PlotSerializer < ActiveModel::Serializer
    attributes :plot_number, :id, :status
    has_many :meters
    has_one :owner
  end
end
