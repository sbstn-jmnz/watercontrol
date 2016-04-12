FactoryGirl.define do
  factory :owner do
    name 'Piero Brunetti'
    rut '15.316.349-9'
  end

  factory :user do
    name "MyString"
    rut "MyString"
    role User::ROLE.third
  end

  factory :condo do
    description 'Condominio Quilimari'
    name 'Rio Mar'
  end

  factory :sector do
    name 'Las Palmas'
    condo
  end

  factory :plot do
    plot_number '101'
    status Plot::STATUS.first
    owner
    sector
  end

  factory :meter do
    number '123'
    status Meter::STATUS.first
    plot
  end

  factory :meter_two, class: Meter do
    number '123'
    status Meter::STATUS.first
    plot
  end

  factory :measure_process do
    fixed 10.1
    normal_price 15
    over_consumption_price 19
    status MeasureProcess::STATUS.first
  end

  factory :charge_parameter do
    fixed 10.1
    normal_price 15
    over_consumption_price 19
    condo
  end

  factory :measure do
    comment 'bla bla factory'
    status Measure::STATUS.first
    value 207
    meter
    user
    measure_process
  end

  factory :measure_two, class: Measure do
    comment 'bla bla factory'
    status Measure::STATUS.first
    value 207
    meter
    user
    measure_process
  end

end
