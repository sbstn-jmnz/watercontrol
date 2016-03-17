class PlotSerializer < ActiveModel::Serializer
  attributes *Plot.column_names
end
