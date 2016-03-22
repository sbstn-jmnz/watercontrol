class AddSectorToPlots < ActiveRecord::Migration
  def change
    add_reference :plots, :sector, index: true, foreign_key: true
  end
end
