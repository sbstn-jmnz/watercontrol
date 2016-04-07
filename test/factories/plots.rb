FactoryGirl.define do
  factory :plot_one, class: Plot do
    plot_number '1'
    status 'sold'
    sector
    owner_one
  end
  factory :plot_two do
    plot_number '2'
    status 'sold'
    sector_two
    owner_two
  end
  factory :plot_three do
    plot_number '3'
    status 'available'
    sector_three
    owner_three
  end
  factory :plot_four do
    plot_number '4'
    status 'available'
    sector_four
    owner_four
  end

end