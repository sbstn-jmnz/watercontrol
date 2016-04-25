FactoryGirl.define do
  factory :invoice do
    idCorrentista 1
    meter_number "MyString"
    last_value 1
    current_value 1
    normal_price 1
    fixed_price 1
    image "MyString"
    over_consumption_price "MyString"
    normal_limit 1
    base_consumption 1
  end
end
