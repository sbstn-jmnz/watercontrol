class CreateMeasureProcesses < ActiveRecord::Migration
  def change
    create_table :measure_processes do |t|
      t.string :status
      t.timestamp :closed_at

      t.timestamps null: false
    end
  end
end
