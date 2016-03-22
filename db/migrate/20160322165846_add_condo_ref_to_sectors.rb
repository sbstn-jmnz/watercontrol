class AddCondoRefToSectors < ActiveRecord::Migration
  def change
    add_reference :sectors, :condo, index: true, foreign_key: true
  end
end
