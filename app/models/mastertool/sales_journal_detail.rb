class SalesJournalDetail < ActiveRecord::Base
  establish_connection "#{Rails.env}_sales_database".to_sym
  self.table_name = "LibroVentaDetalle"
  self.primary_key = "idDetalleVenta"

  belongs_to :sales_journal
end
