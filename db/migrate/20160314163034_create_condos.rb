class CreateCondos < ActiveRecord::Migration
  def change
    create_table :condos do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
