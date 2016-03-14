class AddStateToPlots < ActiveRecord::Migration
  def change
    add_column :plots, :state, :string
  end
end
