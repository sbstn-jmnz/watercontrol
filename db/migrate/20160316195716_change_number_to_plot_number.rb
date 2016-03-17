class ChangeNumberToPlotNumber < ActiveRecord::Migration
  def change
    rename_column :plots, :number, :plot_number
  end
end
