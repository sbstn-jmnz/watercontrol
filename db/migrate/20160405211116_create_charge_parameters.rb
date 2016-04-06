class CreateChargeParameters < ActiveRecord::Migration
  def change
    create_table :charge_parameters do |t|
      t.column :fixed, :numeric
      t.column :normal_price, :numeric
      t.column :over_consumption_price, :numeric

      t.timestamps null: false
    end
  end
end
