FactoryGirl.define do
  factory :owner do
    name 'Piero Brunetti'
    rut '15.316.349-9'
  end

  factory :user do
    name "MyString"
    rut "MyString"
    email 'info@mastertool.cl'
    password 'secretcode'
    role User::ROLE.third
  end

  factory :condo do
    description 'Condominio Quilimari'
    name 'Rio Mar'
  end

  factory :sector do
    name 'Las Palmas'
    condo
    user
  end

  factory :sector_2, class: :sector do
    name 'Las Qubradas'
    condo
    user
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
  end

  factory :meter_two, class: Meter do
    number '124'
    status Meter::STATUS.first
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
  end

  factory :measure do
    comment 'bla bla factory'
    status Measure::STATUS.first
    value 207
  end

  factory :measure_two, class: Measure do
    comment 'bla bla factory'
    status Measure::STATUS.first
    value 207
    meter
    user
    measure_process
  end

  factory :measure_from_admin, class: Measure do
    to_create {|instance| instance.save(validate: false)}
  end

  factory :admin do
      auth_token "MyString"
      name "MyString"
      rut "MyString"
      email 'infoadmin@mastertool.cl'
      password 'secretcodeadmin'
    end
end
