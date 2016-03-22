class AddMeasurerReferenceToMeasures < ActiveRecord::Migration
  def change
    add_reference :measures, :user, index: true, foreign_key: true
  end
end
