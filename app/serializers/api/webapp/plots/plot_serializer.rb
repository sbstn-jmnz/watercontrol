class PlotSerializer < ActiveModel::Serializer
  attributes *Plot.column_names

  belongs_to :condo_id
  has_many :meters
end
