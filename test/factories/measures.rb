FactoryGirl.define do
  factory :measure do
    id 1
    meter_id 1
    comment "the comment"
    value 9999
    status Measure::STATUS.first
  end
end