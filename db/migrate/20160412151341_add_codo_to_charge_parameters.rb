class AddCodoToChargeParameters < ActiveRecord::Migration
  def change
    add_reference :charge_parameters, :condo, index: true, foreign_key: true
  end
end
