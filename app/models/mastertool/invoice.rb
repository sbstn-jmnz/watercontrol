class Invoice < ActiveRecord::Base
  require 'FileUtils'
  establish_connection "#{Rails.env}_sales_database".to_sym
  belongs_to :owner

  def self.create_invoices(process_id, condo_id)

    condo = Condo.find(condo_id)
    process = MeasureProcess.find(process_id)
    #Genera todas las facturas
    condo.meters.each do |meter|

      #########  Generar una imagen del consumo de últimos 12 meses por medidor  ###############
      graph_data_array = []
      meters_for_year = meter.measures.last(12);

      meters_for_year.each_with_index do |measure, i|

        if(i === meters_for_year.count - 1)
         break
        end

        consumption = meters_for_year[i+1].value - measure.value;

        graph_data = {
          consumption: consumption < 0 ? 0
                                       : consumption,
          created_at: meters_for_year[i+1].updated_at,
          month_label: meters_for_year[i+1].updated_at.strftime("%b")
        }

        graph_data_array.push(graph_data)
      end

      #Si no se han generado 12 muestras, rellenar con consumo 0
      if(graph_data_array.count < 12)

        pivot_date = graph_data_array[0][:created_at]

        (1..(12 - graph_data_array.count)).each do |n|
          graph_data_array.unshift({
            consumption: 0,
            created_at: pivot_date - (n).month,
            month_label: (pivot_date - (n).month).strftime("%b")
          })
        end
      end

      image = self.create_consumption_image(graph_data_array)
      #################################################################################

      invoice = self.new;

      # invoice.base_consumption = process.base_consumption;
      invoice.over_consumption_price = process.over_consumption_price;
      invoice.normal_price = process.normal_price;
      invoice.fixed_price = process.fixed;
      invoice.image = image;

      invoice.save;
    end

    #Después de generar todas las imagenes, borrar el archivo usado como "pivote" para guardar las imagenes generadas
    FileUtils.rm('consumption.png')

  end


  def self.create_consumption_image(graph_data)

    canvas_width = 600
    canvas_height = 400
    bar_width = 40
    bar_margin = 10
    canvas_y_top = 350

    canvas = Magick::Image.new(canvas_width, canvas_height)
    canvas.background_color = 'white'

    gc = Magick::Draw.new

    #Dibuja el eje coordenado y título
    gc.pointsize(24)
    gc.text(canvas_width/2 - 100,20, "Consumo últimos 12 meses")

    #Eje Y
    gc.line(2,55, 5,50)
    gc.line(5,50, 8,55)
    gc.line(5,50 , 5,canvas_y_top)

    #Eje X
    gc.line(5,canvas_y_top , canvas_width,canvas_y_top)


    #Dibuja las barras por cada mes
    gc.pointsize(12)
    graph_data.each_with_index do |data, i|
      x1Coord = bar_margin + (bar_width + bar_margin)*i
      y1Coord = canvas_y_top - (data[:consumption].to_f/canvas_height)*100
      x2Coord = x1Coord + bar_width
      y2Coord = canvas_y_top

      gc.text(x1Coord + 10,y2Coord + 35, data[:month_label])

      if data[:consumption] > 0
        gc.rectangle(x1Coord, y1Coord,x2Coord, y2Coord)
        gc.text(x1Coord + 10,y2Coord + 20, data[:consumption].to_s)
      end

    end

    gc.draw(canvas)

    canvas.write('consumption.png')

    # imageEncoded = Base64.strict_encode64(open('consumption.png') { |io| io.read })
    
    # puts "*********************************"
    # puts  imageEncoded
    # puts "*********************************"
    
    # return imageEncoded
    
    return IO.binread(open('consumption.png'))

  end


end
