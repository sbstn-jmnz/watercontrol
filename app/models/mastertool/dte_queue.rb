class DteQueue < ActiveRecord::Base
  establish_connection "#{Rails.env}_sales_database".to_sym
  self.table_name = "DTECola"
  self.primary_key = "idDTECola"

  belongs_to :sales_journal, foreign_key: 'idLibro'
  has_one :purchase_order_electronic
end
