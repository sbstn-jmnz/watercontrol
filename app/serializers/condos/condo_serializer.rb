class CondoSerializer < ActiveModel::Serializer
  attributes *Condo.column_names
end
