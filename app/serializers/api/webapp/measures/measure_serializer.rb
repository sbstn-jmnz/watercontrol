module Api::Webapp::Measures
  class MeasureSerializer < ActiveModel::Serializer
    attributes :id, :value, :state, :comment, :user
    belongs_to :meter_id

    def user
      User.find(object.user_id).name
    end

  end
end
