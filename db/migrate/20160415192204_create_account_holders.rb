class CreateAccountHolders < ActiveRecord::Migration
  def connection
    ActiveRecord::Base.establish_connection("#{Rails.env}_account_holders").connection
  end
end
