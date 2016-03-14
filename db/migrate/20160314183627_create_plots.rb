class CreatePlots < ActiveRecord::Migration
  def change
    create_table :plots do |t|
      t.references :condo, index: true, foreign_key: true
      t.string :number

      t.timestamps null: false
    end
  end
end
