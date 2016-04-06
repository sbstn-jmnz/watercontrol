class AddProcessIndexToMeasures < ActiveRecord::Migration
  def change
    add_reference :measures, :measure_process, index: true, foreign_key: true
  end
end
