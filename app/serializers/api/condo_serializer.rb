  class Api::Webapp::CondoSerializer < ActiveModel::Serializer
    attributes :id, :name, :description

    has_many :plots
  end
