FactoryGirl.define do
  factory :owner_one, class: Owner do
    name "owner one"
    rut "1.111.111-1"
  end
  factory :owner_two do
    name "owner two"
    rut "2.222.222-2"
  end
  factory :owner_three do
    name "owner three"
    rut "3.333.333-3"
  end
  factory :owner_four do
    name "owner two"
    rut "4.444.444-4"
  end
end
