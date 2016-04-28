class CashMovementPaymentMethod < ActiveRecord::Base
  establish_connection "#{Rails.env}_sales".to_sym
  self.table_name = "MvtoCajaFormaPago"
  
  belongs_to :cash_movement
end
