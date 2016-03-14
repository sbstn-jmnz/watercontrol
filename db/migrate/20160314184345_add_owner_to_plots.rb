class AddOwnerToPlots < ActiveRecord::Migration
  def change
    add_reference :plots, :owner, index: true, foreign_key: true
  end
end
