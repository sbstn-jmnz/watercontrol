class AddBaseConsumptionToChargeParameters < ActiveRecord::Migration
  def change
    add_column :charge_parameters, :base_consumption, :integer
  end
end
