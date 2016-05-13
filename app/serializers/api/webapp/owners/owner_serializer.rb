module Api::Webapp::Owners
  class OwnerSerializer < ActiveModel::Serializer
      attributes *Owner.column_names
      has_many :plots
  end
end
