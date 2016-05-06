class Invoice < ActiveRecord::Base
  establish_connection "#{Rails.env}_sales_database".to_sym
  belongs_to :owner
  has_one :purchase_order

  validates :base_consumption, :current_value, :fixed_price, :idCorrentista, :last_value,
            :normal_limit, :normal_price, :over_consumption_price, numericality: true

  validates  :base_consumption, :current_value, :due_date, :fixed_price, :idCorrentista,
             :image, :last_invoice_date, :last_value, :meter_number, :normal_limit, :normal_price,
             :over_consumption_price, presence: true

  validates :owner, presence: true


  def self.create_invoices(process_id, condo_id)
    condo = Condo.find(condo_id)
    process = MeasureProcess.find(process_id)
    #Genera todas las facturas
    condo.meters.each do |meter|
      invoice = self.new;
      invoice.base_consumption = 1680 #preguntar
      invoice.current_value = meter.current_measure_value
      invoice.last_value = meter.last_measure_value
      invoice.due_date = process.created_at + 1.month
      invoice.fixed_price = process.fixed
      invoice.idCorrentista = meter.idCorrentista
      invoice.graph_data_array = meter.graph_data_array
      invoice.last_invoice_date = invoice.set_last_invoice_date(last_measure_process_id)
      invoice.meter_number = meter.number
      invoice.normal_limit = meter.normal_limit
      invoice.normal_price = process.normal_price;
      invoice.plot_number = meter.plot_number
      invoice.over_consumption_price = process.over_consumption_price
      invoice.save;
    end
  end

  def set_last_invoice_date(process_id)
    return MeasureProcess.find(process_id).closed_at
  end

end
