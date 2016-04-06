class AddParametersToMeasureProcesses < ActiveRecord::Migration
  def change
    add_column :measure_processes, :fixed, :numeric
    add_column :measure_processes, :normal_price, :numeric
    add_column :measure_processes, :over_consumption_price, :numeric
  end
end
