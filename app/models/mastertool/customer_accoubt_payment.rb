class CustomerAccountPayment < ActiveRecord::Base
  establish_connection "#{Rails.env}_sales".to_sym
  self.table_name = "PagoCtaCteCliente"
  self.primary_key = "idPagoEfectivo"

  belongs_to :cash_movement
end
