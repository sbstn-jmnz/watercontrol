class Condos::CondoSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :url
  has_many :plots

  def url
  #condo_url(object)
  end

end
