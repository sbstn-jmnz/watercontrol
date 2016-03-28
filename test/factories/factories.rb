FactoryGirl.define do
  factory :condo do
    name "Campo Mar Factory"
    description "Condominio Campo Mar Algarrobo"

      factory :condo_with_sectors do
        after(stub) do |variable|

        end
      end
  end
end
