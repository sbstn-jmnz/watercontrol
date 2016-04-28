class SalesJournal < ActiveRecord::Base
  establish_connection "#{Rails.env}_sales_database".to_sym
  self.table_name = "LibroVenta"
  self.primary_key = "idLibroVenta"

  has_many :sales_journal_details
  has_one :purchase_order_document
  has_one :cash_movement
  has_one :dte_queue, foreign_key: 'idLibro'
  has_one :purchase_order_electronic
end
