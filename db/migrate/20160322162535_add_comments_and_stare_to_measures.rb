class AddCommentsAndStareToMeasures < ActiveRecord::Migration
  def change
    add_column :measures, :comment, :text
    add_column :measures, :status, :string
  end
end
