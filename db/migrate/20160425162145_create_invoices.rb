class CreateInvoices < ActiveRecord::Migration
  def connection
    ActiveRecord::Base.establish_connection("#{Rails.env}_sales_database").connection
  end
end
