class RemoveConodoIdFromPlots < ActiveRecord::Migration
  def up
    remove_index(:plots, :name => 'index_plots_on_condo_id', column: :condo_id)
    remove_column :plots, :condo_id
  end

  def down
    add_column :plots, :condo_id, :integer
    add_index :plots, :condo_id
  end
end
