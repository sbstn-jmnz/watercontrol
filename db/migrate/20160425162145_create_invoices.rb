class CreateInvoices < ActiveRecord::Migration
  def connection
    ActiveRecord::Base.establish_connection("#{Rails.env}_invoices").connection
  end
end
