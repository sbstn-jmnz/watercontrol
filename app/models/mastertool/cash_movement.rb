class CashMovement < ActiveRecord::Base
  establish_connection "#{Rails.env}_sales".to_sym
  self.table_name = "MovimientoCaja"
  self.primary_key = "idMvtoCaja"

  belongs_to :purchase_order
  belongs_to :sales_journal
  has_one :customer_account_payment
  has_one :cash_movement_payment_method
end
