class Invoice < ActiveRecord::Base
  establish_connection "#{Rails.env}_sales".to_sym
  belongs_to :owner

  def self.create_invoices(process_id, condo_id)
    
    last_process_active = MeasureProcess.find(process_id)

    condo = Condo.find(condo_id)
    #Genera todas las facturas 
    condo.meters.each do |meter|

      graph_data_array = []
      
      meters_for_year = meter.measures.last(12);
      
      meters_for_year.each_with_index do |measure, i|
        
        if(i === meters_for_year.count - 1)
         break
        end

        graph_data = {
          consumption: meters_for_year[i+1].value - measure.value,
          created_at: meters_for_year[i+1].created_at,
          month_label: meters_for_year[i+1].created_at.strftime("%b")
        }

        graph_data_array.push(graph_data)

      end
      
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
      debugger;
    end

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
    gc.text(canvas_width/2 - 100,20, 'Consumo últimos 12 meses')
    
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
    
    canvas.write('tst.png')
    imageEncoded = Base64.strict_encode64(open('tst.png') { |io| io.read })
    
    return imageEncoded
  end


end
