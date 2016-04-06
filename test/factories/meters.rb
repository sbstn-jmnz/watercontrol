FactoryGirl.define do
  factory :meter do
    plot_id 1
    number 5
    status METER_STATUS.first
  end
end