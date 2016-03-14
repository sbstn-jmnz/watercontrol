class CreateMeters < ActiveRecord::Migration
  def change
    create_table :meters do |t|
      t.references :plot, index: true, foreign_key: true
      t.string :number
      t.string :state

      t.timestamps null: false
    end
  end
end
