class AccountHolder < ActiveRecord::Base
  establish_connection "#{Rails.env}_account_holders".to_sym
  self.table_name = "CuentaCorriente"
  self.primary_key = "idCorrentista"

  def self.import
    
  end
end
