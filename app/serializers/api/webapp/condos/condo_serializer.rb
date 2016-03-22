module Api::Webapp::Condos
  class CondoSerializer < ActiveModel::Serializer
    attributes :id, :name, :description
    has_many :plots, serializer: Plots::PlotSerializer
    
  end
end
