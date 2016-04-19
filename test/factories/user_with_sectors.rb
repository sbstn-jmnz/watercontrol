FactoryGirl.define do
    factory :user_with_sectors, class: :user do
      name "MyString"
      rut "MyString"
      email 'info@mastertool.cl'
      password 'secretcode'
      role User::ROLE.third
      sectors {[FactoryGirl.build(:sector), FactoryGirl.build(:sector_2)]}
  end
end
