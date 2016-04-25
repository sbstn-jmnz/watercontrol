class Invoice < ActiveRecord::Base
  establish_connection "#{Rails.env}_sales".to_sym
  belongs_to :owner

  def create_invoices
    
  end
end
