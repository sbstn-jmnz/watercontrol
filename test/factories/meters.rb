FactoryGirl.define do
  factory :meter do
    id 1
    plot_id 1
    number 5
    status METER_STATUS.first
  end
end