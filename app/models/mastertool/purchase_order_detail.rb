class PurchaseOrderDetail < ActiveRecord::Base
  establish_connection "#{Rails.env}_sales".to_sym
  self.table_name = "DetalleNotaPedido"
  self.primary_key = "idDetalleNP"

  belongs_to :purchase_order
  
end
