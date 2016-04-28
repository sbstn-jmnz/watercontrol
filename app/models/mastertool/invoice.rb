class Invoice < ActiveRecord::Base
  establish_connection "#{Rails.env}_sales_database".to_sym
  belongs_to :owner

  def create_invoices(condo_id)

    last_process_active = MeasureProcess.last

    meters_subject_to_invoice = [];

    #Genera todas las facturas
    Condo.find(condo_id).sectors.each do |sector|

      sector.plots.each do |plot|

        plot.meters.each do |meter|

          #Sin importar
          meter.measures.where(:measure_process_id => last_process_active.id, )

          end
        end
      end

    #@users = User.where(:created_at => start_date.to_time..end_date.to_time)


    # self.image = create_consumption_image

    # self.save

  end




  def write_main_graph



  end

  def create_consumption_image
    canvas = Magick::Image.new(800, 300){self.background_color = 'white'}

    gc = Magick::Draw.new
    gc.pointsize(12)

    #x1,y1,x2,y2
    gc.rectangle(30, 100, 70, 250)
    gc.text(30,270, "Enero")

    gc.rectangle(80, 150, 120, 250)
    gc.text(80,270, "Febrero")

    gc.rectangle(130, 120, 170, 250)
    gc.text(130,270, "Marzo")

    gc.rectangle(180, 220, 220, 250)
    gc.text(180,270, "Abril")

    gc.rectangle(230, 100, 270, 250)
    gc.text(230,270, "Mayo")

    gc.draw(canvas)

    canvas.write('tst.png')

    imageEncoded = Base64.strict_encode64(open('tst.png') { |io| io.read })

    return imageEncoded
    end


end
