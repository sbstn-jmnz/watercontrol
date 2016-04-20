# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
    AdminsCondo.destroy_all
    Sector.destroy_all
    User.destroy_all
    Plot.destroy_all
    Admin.destroy_all
    MeasureProcess.destroy_all
    Condo.destroy_all

    Admin.create([{ name: 'Seba', rut: '15.316.349-9', email: 'admin1@mastertool.cl', password:'secretcodeadm1', role: Admin::ROLE.second },
                 { name: 'Gonzalo',rut: '16.299.222-8', email: 'admin2@mastertool.cl', password:'secretcodeadm1', role: Admin::ROLE.first},
                 { name: 'Jenny',rut: '1.111.111-1', email: 'admin3@mastertool.cl', password:'secretcode1adm'}, role: Admin::ROLE.first])

    Condo.create([{ name: 'Rio Mar', description: 'Primer condo', admin_id: Admin.first.id},
                  { name: 'Campo Mar',description: 'Primer condo', admin_id: Admin.second.id}])

    AdminsCondo.create([{ admin_id: Admin.first.id, condo_id: Condo.first.id},
                        { admin_id: Admin.first.id, condo_id: Condo.second.id}])

    ChargeParameter.create([{ fixed: 500, normal_price: 30, over_consumption_price: 90, condo_id: Condo.first.id},
                            { fixed: 1500, normal_price: 130, over_consumption_price: 190, condo_id: Condo.second.id}])

    User.create([{ name: 'User1', rut: '15.316.349-9', role: User::ROLE.first, email: 'info1@mastertool.cl', password:'secretcode1' },
                 { name: 'User2',rut: '16.299.222-8',role: User::ROLE.first, email: 'info2@mastertool.cl', password: 'secretcode2'},
                 { name: 'User3',rut: '1.111.111-1',role: User::ROLE.first, email: 'info3@mastertool.cl', password: 'secretcode3'}])

    Sector.create([{ name: 'Las Palmas', condo_id: Condo.first.id, user_id: User.first.id },
                 { name: 'Las Liebres', condo_id: Condo.first.id, user_id: User.first.id },
                 { name: 'El Pozo', condo_id: Condo.first.id, user_id: User.first.id },
                 { name: 'El Puente', condo_id: Condo.first.id, user_id: User.first.id },
                 { name: 'Los Aromos', condo_id: Condo.first.id, user_id: User.first.id },
                 { name: 'Los Cipres', condo_id: Condo.last.id, user_id: User.second.id },
                 { name: 'Los Pinos', condo_id: Condo.last.id, user_id: User.second.id },
                 { name: 'Las Lomas', condo_id: Condo.last.id, user_id: User.second.id },
                 { name: 'Las Liebres', condo_id: Condo.last.id, user_id: User.second.id },
                 { name: 'El Bosque', condo_id: Condo.last.id, user_id: User.second.id }])

    Owner.create([{ name: 'Seba', rut: '15.316.349-9' },
                 { name: 'Gonzalo',rut: '16.299.222-8'},
                 { name: 'Jenny',rut: '1.111.111-1' }])


    MeasureProcess.create([{ fixed: 234.45, normal_price: 250, over_consumption_price: 200, status: MeasureProcess::STATUS.second},
                           { fixed: 214.35, normal_price: 250, over_consumption_price: 220, status: MeasureProcess::STATUS.second},
                           { fixed: 202.25, normal_price: 200, over_consumption_price: 180, status: MeasureProcess::STATUS.first}])


#Plots, Meters and Measures for Condo Rio Mar
    for n in 1..10
      if n % 2 == 0
        plot = Plot.create(plot_number: n, status: "sold", sector_id: Sector.where(condo_id: Condo.first.id).first.id,
        owner_id: Owner.order("RANDOM()").first.id)
        Meter.create(number: (n+100).to_s, status: "active", plot_id: plot.id)
        Meter.create(number: (n+200).to_s, status: "active", plot_id: plot.id)
      else
        plot = Plot.create(plot_number: n, status: "available", sector_id: Sector.where(condo_id: Condo.first.id).last.id,
        owner_id: Owner.order("RANDOM()").first.id)
        Meter.create(number: (n+100).to_s, status: "inactive", plot_id: plot.id)
      end
    end
#Plots, Meters and Measures for Condo Campo Mar
    for n in 1..10
      if n % 2 == 0
        plot = Plot.create(plot_number: n+10, status: "sold", sector_id: Sector.where(condo_id: Condo.last.id).first.id,
        owner_id: Owner.order("RANDOM()").first.id)
        Meter.create(number: (n+100).to_s, status: "active", plot_id: plot.id)
      else
        plot = Plot.create(plot_number: n+10, status: "sold", sector_id: Sector.where(condo_id: Condo.last.id).first.id,
        owner_id: Owner.order("RANDOM()").first.id)
        Meter.create(number: (n+100).to_s, status: "active", plot_id: plot.id)
      end
    end

    Meter.all.each do |meter|
      MeasureProcess.all.each do |process|
        if process.status == MeasureProcess::STATUS.second
          Measure.create( comment: 'blah blah', meter_id: meter.id, status: Measure::STATUS.third, user_id: User.last.id,
          value: 100, measure_process_id: process.id )
        else
          Measure.create( comment: 'blah blah', meter_id: meter.id, status: Measure::STATUS.first, user_id: User.last.id,
          value: 0, measure_process_id: process.id )
        end
      end
    end
