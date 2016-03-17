class OwnerSerializer < ActiveModel::Serializer
attributes *Owner.column_names
end
