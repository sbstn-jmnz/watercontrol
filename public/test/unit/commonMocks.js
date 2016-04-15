(function() {
  
  'use strict';


  var condosArray = [
      { id: 1,
        name: 'Rio Mar',
        created_at: '2016-03-17T18:34:09.135Z',
        updated_at: '2016-03-17T18:34:09.135Z',
        description: 'Primer condo'},
      {  id: 2,
        name: 'Campo Mar',
        created_at: '2016-03-17T18:34:09.143Z',
        updated_at: '2016-03-17T18:34:09.143Z',
        description: 'Primer condo'
      }],

    condoObj = {
      id:1,
      name:'Rio Mar',
      description:'Primer condo',
      sectors:[
        { id:1,
          name:'Las Palmas',
          plots:[
            
            { id:2,
              plot_number:'2',
              meters:[
                { id:2,
                  number:'102',
                  state:'active',
                  last_measure:{
                    id:20,
                    value:1000,
                    created_at:'2016-03-24T12:25:07.098Z',
                    comment:'blah blah'
                  },
                  last_measurer:'Jenny'}]
            },

            { id:4,
              plot_number:'4',
              meters:[
                { id:4,
                  number:'104',
                  state:'active',
                  last_measure:{
                    id:40,
                    value:1000,
                    created_at:'2016-03-24T12:25:07.433Z',
                    comment:'blah blah'},
                  last_measurer:'Jenny'}]
            }]
        }]
    },
    
    plotObj = {
      id: 4,
      plot_number: '4',
      owner: {
      id: 3,
      name: 'Jenny',
      rut: '1.111.111-1',
      created_at: '2016-03-28T18:35:56.064Z',
      updated_at: '2016-03-28T18:35:56.064Z'
      },
      meters: [
        {
          id: 4,
          plot_id: 4,
          number: '104',
          status: 'active',
          created_at: '2016-03-28T18:35:56.218Z',
          updated_at: '2016-03-28T18:35:56.218Z'
        }
      ],
      sector_id: 1,
      owner_id: 3
    },

    configurationArray =  [{  id: 1,
                              idperiodo: 50,
                              configuration: {
                                valSobreConsumo: 15000,
                                cargoFijo: 35000
                              }
                          }],
    periodsArray =  [{
                        id: 50,
                        startdate: '2016-01-01T00:00:00.000Z',
                        enddate: '2016-03-310T00:00:00.000Z' },
                     {
                        id: 51,
                        startdate: '2016-04-010T00:00:00.000Z',
                        enddate: '2016-04-150T00:00:00.000Z'
                    }],

    user = {
      id:1,
      name:'Seba',
      rut:'15.316.349-9',
      created_at:'2016-03-23T18:36:34.404Z',
      updated_at:'2016-03-23T18:36:34.404Z',
      role_id:1
    },
    
    usersArray = [{id:1,name:'Seba',rut:'15.316.349-9',created_at:'2016-03-23T18:36:34.404Z',updated_at:'2016-03-23T18:36:34.404Z',role_id:1},
                  {id:2,name:'Gonzalo',rut:'16.299.222-8',created_at:'2016-03-23T18:36:34.416Z',updated_at:'2016-03-23T18:36:34.416Z',role_id:3},
                  {id:3,name:'Jenny',rut:'1.111.111-1',created_at:'2016-03-23T18:36:34.424Z',updated_at:'2016-03-23T18:36:34.424Z',role_id:2}],


    measureProcesses = [{id:1,status:'active',closed_at:null,created_at:'2016-04-08T21:00:04.866Z',updated_at:'2016-04-08T21:00:04.866Z',fixed:234.45,normal_price:250.0,over_consumption_price:200.0},
                        {id:2,status:'closed',closed_at:null,created_at:'2016-04-08T21:00:04.871Z',updated_at:'2016-04-08T21:00:04.871Z',fixed:214.35,normal_price:250.0,over_consumption_price:220.0},
                        {id:3,status:'closed',closed_at:null,created_at:'2016-04-08T21:00:04.874Z',updated_at:'2016-04-08T21:00:04.874Z',fixed:202.25,normal_price:200.0,over_consumption_price:180.0}],

    chargeParameters = {
      fixed: 300,
      normal_price: 50,
      over_consumption_price: 60
    };


  
  angular
    .module('CommonMocks', ['MedicionAguaAdmin'])
    .constant('COMMON_MOCKS', {
      CONDOS: condosArray,
      CONDO: condoObj,
      PLOT: plotObj,
      PERIODS: periodsArray,
      CONF: configurationArray,
      USER: user,
      USERS: usersArray,
      MEASURE_PROCESSES : measureProcesses,
      CHARGE_PARAMETERS: chargeParameters
  });

})();