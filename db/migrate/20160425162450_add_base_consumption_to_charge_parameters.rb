class AddBaseConsumptionToChargeParameters < ActiveRecord::Migration
  def connection
    ActiveRecord::Base.establish_connection("#{Rails.env}").connection
  end

  def change
    add_column :charge_parameters, :base_consumption, :integer
  end
end
