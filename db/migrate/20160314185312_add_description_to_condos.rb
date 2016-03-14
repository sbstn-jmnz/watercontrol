class AddDescriptionToCondos < ActiveRecord::Migration
  def change
    add_column :condos, :description, :text
  end
end
