class CreateMeasures < ActiveRecord::Migration
  def change
    create_table :measures do |t|
      t.references :meter, index: true, foreign_key: true
      t.integer :value

      t.timestamps null: false
    end
  end
end
