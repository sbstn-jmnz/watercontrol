class CreateAdminCondoJoinTable < ActiveRecord::Migration
  def up
    create_table :admins_condos, :id => false do |t|
      t.integer :admin_id
      t.integer :condo_id
    end
  end

  def down
    drop_table :admins_condos
  end
end
