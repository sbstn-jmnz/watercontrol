class MeterSerializer < ActiveModel::Serializer
  attributes *Meter.column_names
end
