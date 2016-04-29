class AddCondoToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :condo, index: true, foreign_key: true
  end
end
