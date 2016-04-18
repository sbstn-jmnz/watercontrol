class AddAdminToCondos < ActiveRecord::Migration
  def change
    add_reference :condos, :admin, index: true, foreign_key: true
  end
end
