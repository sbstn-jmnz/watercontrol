# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
    Plot.destroy_all
    Condo.destroy_all

    Condo.create([{ name: 'Rio Mar', description: 'Primer condo' },
                  { name: 'Campo Mar',description: 'Primer condo' }])

    for n in 1..10
        Plot.create(plot_number: n, condo_id: Condo.first.id)
    end

    for n in 1..10
        Plot.create(plot_number: n+10, condo_id: Condo.last.id)
    end
