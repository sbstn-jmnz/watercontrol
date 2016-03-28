class AddStatusToPlots < ActiveRecord::Migration
  def change
    add_column :plots, :status, :string
  end
end
