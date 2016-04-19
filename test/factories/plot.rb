FactoryGirl.define do
    factory :plot_with_owner_and_sector, class: :plot do
    plot_number '101'
    status Plot::STATUS.first
    owner
    sector
  end

    factory :plot_2_with_owner_and_sector, class: :plot do
    plot_number '102'
    status Plot::STATUS.first
    owner
    sector
  end
end
