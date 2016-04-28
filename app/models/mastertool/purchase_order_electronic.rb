class PurchaseOrderElectronic < ActiveRecord::Base
  establish_connection "#{Rails.env}_sales".to_sym
  self.table_name = "NotaPedidoElectronica"
  self.primary_key = "idNotaPedidoElectronica"

  belongs_to :dte_queue
end
