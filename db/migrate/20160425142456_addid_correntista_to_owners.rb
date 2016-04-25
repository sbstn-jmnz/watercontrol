class AddidCorrentistaToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :idCorrentista, :integer
  end
end
