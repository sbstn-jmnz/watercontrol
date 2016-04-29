class PurchaseOrder < ActiveRecord::Base
  establish_connection "#{Rails.env}_sales".to_sym
  self.table_name = "NotaPedido"
  self.primary_key = "idNotaPedido"

  belongs_to :invoice
  has_many :purchase_order_details

end
