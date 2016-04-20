class RemoveAdminIdFromCondos < ActiveRecord::Migration
  def up
    remove_index(:condos, :name => 'index_condos_on_admin_id', column: :admin_id)
    remove_column :condos, :admin_id
  end

  def down
    add_column :condos, :admin_id, :integer
    add_index :condos, :admin_id
  end
end
