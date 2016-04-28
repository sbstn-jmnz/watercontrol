  ##Destruye todo para partir de cero sin problemas de id's
    AdminsCondo.destroy_all
    Sector.destroy_all
    User.destroy_all
    Plot.destroy_all
    Admin.destroy_all
    MeasureProcess.destroy_all
    Condo.destroy_all

  #Crea tres administradores: dos con rol admin y un rol superadmin
    Admin.create([{ name: 'Gonzalo', rut: '15.316.349-9', email: 'admin1@mastertool.cl', password:'secretcodeadm1', role: Admin::ROLE.second },
                 { name: 'Seba',rut: '16.299.222-8', email: 'admin2@mastertool.cl', password:'secretcodeadm1', role: Admin::ROLE.first},
                 { name: 'Jenny',rut: '1.111.111-1', email: 'admin3@mastertool.cl', password:'secretcode1adm'}, role: Admin::ROLE.first])

  #Crea dos condominios
    Condo.create([{ name: 'Rio Mar', description: 'Primer condo'},
                  { name: 'Campo Mar',description: 'Primer condo'}])

  #Relacion de administradores y condominios, el superadmin tiene los dos condominios
    AdminsCondo.create([{ admin_id: Admin.first.id, condo_id: Condo.first.id},
                        { admin_id: Admin.first.id, condo_id: Condo.second.id},
                        { admin_id: Admin.second.id, condo_id: Condo.first.id},
                        { admin_id: Admin.third.id, condo_id: Condo.second.id}])

  #Crea los parametros de cobro inicial por cada condominio
    ChargeParameter.create([{ fixed: 500, normal_price: 30, over_consumption_price: 90, condo_id: Condo.first.id},
                            { fixed: 1500, normal_price: 130, over_consumption_price: 190, condo_id: Condo.second.id}])

  #Crea los usuarios de la aplicacion mobile
    User.create([{ name: 'User1', rut: '15.316.349-9', email: 'info1@mastertool.cl', password:'secretcode1' },
                 { name: 'User2',rut: '16.299.222-8', email: 'info2@mastertool.cl', password: 'secretcode2'},
                 { name: 'User3',rut: '2.299.222-2', email: 'info3@mastertool.cl', password: 'secretcode3'},
                 { name: 'User4',rut: '1.111.111-1', email: 'info4@mastertool.cl', password: 'secretcode4'}])

  #Crea 6 sectores a cada condominio, dos sectores por usuario de aplicacion mobile
    Sector.create([{ name: 'Las Palmas', condo_id: Condo.first.id, user_id: User.first.id },
                 { name: 'Las Liebres', condo_id: Condo.first.id, user_id: User.first.id },
                 { name: 'El Pozo', condo_id: Condo.first.id, user_id: User.first.id },
                 { name: 'El Puente', condo_id: Condo.first.id, user_id: User.second.id },
                 { name: 'Los Aromos', condo_id: Condo.first.id, user_id: User.second.id },
                 { name: 'Los Vientos', condo_id: Condo.first.id, user_id: User.second.id },
                 { name: 'Los Cipres', condo_id: Condo.last.id, user_id: User.third.id },
                 { name: 'Los Pinos', condo_id: Condo.last.id, user_id: User.third.id },
                 { name: 'Las Lomas', condo_id: Condo.last.id, user_id: User.third.id },
                 { name: 'Las Liebres', condo_id: Condo.last.id, user_id: User.fourth.id },
                 { name: 'Las Liebres', condo_id: Condo.last.id, user_id: User.fourth.id },
                 { name: 'El Bosque', condo_id: Condo.last.id, user_id: User.fourth.id }])

#Crea los duenos de las parcelas
    Owner.create([{ name: 'Seba', rut: '15.316.349-9' },
                 { name: 'Gonzalo',rut: '16.299.222-8'},
                 { name: 'Raul',rut: '17.269.222-8'},
                 { name: 'German',rut: '18.299.222-8'},
                 { name: 'Rodrigo',rut: '20.299.222-8'},
                 { name: 'Hector',rut: '6.299.222-8'},
                 { name: 'Jenny',rut: '1.111.111-1' }])

#Crea tres procesos de medicion dos pasados y cerrados y uno activo.
MeasureProcess.create([

  { fixed: 212, normal_price: 210, over_consumption_price: 180, status: MeasureProcess::STATUS.second,
    created_at: Time.now.end_of_month - 6.months, closed_at: (Time.now.end_of_month - 6.months) + 24.hours,
    updated_at: (Time.now.end_of_month - 6.months) + 24.hours  },

  { fixed: 234.45, normal_price: 250, over_consumption_price: 200, status: MeasureProcess::STATUS.second,
    created_at: Time.now.end_of_month - 5.months, closed_at: (Time.now.end_of_month - 5.months) + 24.hours ,
    updated_at: (Time.now.end_of_month - 5.months) + 24.hours },

  { fixed: 234.45, normal_price: 250, over_consumption_price: 200, status: MeasureProcess::STATUS.second,
    created_at: Time.now.end_of_month - 4.months, closed_at: (Time.now.end_of_month - 4.months) + 24.hours ,
    updated_at: (Time.now.end_of_month - 4.months) + 24.hours },

  { fixed: 234.45, normal_price: 250, over_consumption_price: 200, status: MeasureProcess::STATUS.second,
    created_at: Time.now.end_of_month - 3.months, closed_at: (Time.now.end_of_month - 3.months) + 24.hours ,
    updated_at: (Time.now.end_of_month - 3.months) + 24.hours },

  { fixed: 214.35, normal_price: 250, over_consumption_price: 220, status: MeasureProcess::STATUS.second,
    created_at: Time.now.end_of_month - 2.months,  closed_at: (Time.now.end_of_month - 2.months) + 24.hours ,
    updated_at: (Time.now.end_of_month - 2.months) + 24.hours },

  { fixed: 202.25, normal_price: 200, over_consumption_price: 180, status: MeasureProcess::STATUS.first,
    created_at: Time.now.end_of_month - 1.months, closed_at: (Time.now.end_of_month - 1.months) + 24.hours }])

#Crea 10 parcelas a cada sector con estado y duenos aleatorios

    Sector.all.each do |sector|
      for n in 1..10
        plot = Plot.create(plot_number: n.to_s + '-' + sector.id.to_s,
                    status: Plot::STATUS.sample,
                    sector_id: sector.id)
        plot.owner_id = Owner.order("RANDOM()").first.id if plot.status ==  Plot::STATUS.first
        plot.save
      end
    end

#Crea los medidores a las parcelas
prob = [1,2,3,4]
    Plot.all.each do |plot|
      if plot.status == Plot::STATUS.first           #Si esta vendida
        Meter.create(number: 100.to_s + plot.plot_number, #numero del medidior
                     status: Meter::STATUS.sample,    #El medidor puede estar activo o no
                     plot_id: plot.id)
        if 1 == prob.sample #Parcelas con dos medidores
          Meter.create(number: 200.to_s + plot.plot_number, #numero del medidior
                       status: Meter::STATUS.sample,    #El medidor puede estar activo o no
                       plot_id: plot.id)
        end
      end
    end

# Crea mediciones a los medidores activos
    Meter.all.each do |meter|
      if meter.status == Meter::STATUS.first
        i = 1
        processes = MeasureProcess.all

        processes.each do |process|
          if process.status == MeasureProcess::STATUS.second #Proceso cerrado

            # debugger;

            Measure.create(
              comment: 'blah blah',
              meter_id: meter.id,
              status: Measure::STATUS.third,
              user_id: User.last.id,
              value: (100 + Random.rand(200))*i,
              measure_process_id: process.id,
              created_at: (Time.now - (processes.count - i).months),
              updated_at: (Time.now - (processes.count - i).months)
            )

            # puts "*********************************************************************************************"
            # puts " For meter_id: " +  meter.id.to_s
            # puts " Time now: " + (Time.now).to_s + " | Months substracted: " + (processes.count - i).to_s
            # puts " Result: " +  (Time.now - (processes.count - i).months).to_s
            # puts "*********************************************************************************************"


            i += 1
          else
            Measure.create( comment: 'blah blah', meter_id: meter.id, status: Measure::STATUS.first, user_id: User.last.id,
            value: 0, measure_process_id: process.id )
          end
        end
      end
    end
