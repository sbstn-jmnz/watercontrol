FactoryGirl.define do
  factory :plot_one do
    plot_number '1'
    state 'sold'
    sector_one
    owner_one
  end
  factory :plot_two do
    plot_number '2'
    state 'sold'
    sector_two
    owner_two
  end
  factory :plot_three do
    plot_number '3'
    state 'available'
    sector_three
    owner_three
  end
  factory :plot_four do
    plot_number '4'
    state 'available'
    sector_four
    owner_four
  end
end
