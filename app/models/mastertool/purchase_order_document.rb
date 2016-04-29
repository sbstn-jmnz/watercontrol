class PurchaseOrderDocument < ActiveRecord::Base
  establish_connection "#{Rails.env}_sales".to_sym
  self.table_name = "NotaPedidoDoctos"
  self.primary_key = "idNPDoctos"

  belongs_to :sales_journal
  belongs_to :purchase_order
end
