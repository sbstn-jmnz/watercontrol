class CreateAccountHolders < ActiveRecord::Migration
  def connection
    ActiveRecord::Base.establish_connection("#{Rails.env}_secondary").connection
  end

  # def change
  #   create_table :account_holders do |t|

  #     t.timestamps null: false
  #   end
  # end
end
