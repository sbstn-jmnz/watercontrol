module Api::Webapp::Measures
  class MeasureSerializer < ActiveModel::Serializer
    attributes :id, :value, :status, :comment, :user
    belongs_to :meter_id
    belongs_to :user_id


    def user
      User.find(object.user_id).name
    end

  end
end
