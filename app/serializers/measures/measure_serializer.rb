class MeasureSerializer < ActiveModel::Serializer
  attributes *Measure.column_names
end
