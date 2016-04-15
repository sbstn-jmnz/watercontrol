class AccountHolder < ActiveRecord::Base
  establish_connection "#{Rails.env}_secondary"
  
  self.table_name = "CuentaCorriente"
  self.primary_key = "idCorrentista"

end