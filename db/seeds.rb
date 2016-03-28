# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
    Sector.destroy_all
    User.destroy_all
    Plot.destroy_all
    Condo.destroy_all
    Role.destroy_all


    Condo.create([{ name: 'Rio Mar', description: 'Primer condo' },
                  { name: 'Campo Mar',description: 'Primer condo' }])

    Role.create([{ name: 'Admin', },
                 { name: 'Meter'},
                 { name: 'SuperAdmin'}])

    Sector.create([{ name: 'Las Palmas', condo_id: Condo.first.id },
                 { name: 'Las Liebres', condo_id: Condo.first.id },
                 { name: 'Los Cipres', condo_id: Condo.last.id },
                 { name: 'El Bosque', condo_id: Condo.last.id }])

    User.create([{ name: 'Seba', rut: '15.316.349-9', role_id: Role.first.id },
                 { name: 'Gonzalo',rut: '16.299.222-8',role_id: Role.last.id },
                 { name: 'Jenny',rut: '1.111.111-1',role_id: Role.where(name: "Meter").take.id }])

    Owner.create([{ name: 'Seba', rut: '15.316.349-9' },
                 { name: 'Gonzalo',rut: '16.299.222-8'},
                 { name: 'Jenny',rut: '1.111.111-1' }])


#Plots, Meters and Measures for Condo Rio Mar
    for n in 1..10
      if n % 2 == 0
        plot = Plot.create(plot_number: n, status: "sold", sector_id: Sector.where(condo_id: Condo.first.id).first.id,
        owner_id: Owner.order("RANDOM()").first.id)
        Meter.create(number: (n+100).to_s, status: "active", plot_id: plot.id)
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
      for n in 1..10
      Measure.create( comment: 'blah blah', meter_id: meter.id, status: MEASURES_STATUS[n], user_id: User.last.id, value: n*100 )
      end
    end
