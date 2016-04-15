(function(){
  'use strict';

  angular
    .module('MedicionAguaAdmin')
    .config(configFn);


  function configFn($stateProvider, APP_SETTINGS){
      
    $stateProvider
      .state('measures.maintenance', {
        url:'maintenance',
        views: {
          'navbar': APP_SETTINGS.NAVBAR_SETTINGS,
          'main' : {
            templateUrl: 'assets/views/maintenance/maintenance.html',
            controller: 'MaintenanceController',
            controllerAs: 'maintenance',
            resolve: {
              
              CondosResolve: ['PlotsService', function(PlotsService){
                return PlotsService.getCondos();
              }],

              PeriodsResolve: ['ConfigurationService', function(ConfigurationService){
                return ConfigurationService.getPeriods();
              }],

              ConfigurationResolve: ['ConfigurationService', function(ConfigurationService){
                return ConfigurationService.getConfiguration();
              }]
            }
          }
        },
        ncyBreadcrumb: {
          label: 'Mantención'
        }
      })

      .state('measures.measureProcesses', {
        url:'measureProcesses',
        views: {
          'navbar': APP_SETTINGS.NAVBAR_SETTINGS,
          'main' : {
            templateUrl: 'assets/views/maintenance/measureProcesses.html',
            controller: 'MeasureProcessesController',
            controllerAs: 'measureProcesses',
            resolve : {
              MeasureProcessesResolve : ['MeasureProcessesService', function(MeasureProcessesService){
                return MeasureProcessesService.getConfig();
              }],
              ChargeParametersResolve: ['ChangeParametersService', function(ChangeParametersService){
                return ChangeParametersService.getParams();
              }]
            }
          }
        },
        ncyBreadcrumb: {
          label: 'Configurar Mediciones'
        }
      })

      .state('measures.assignsector', {
        url:'assignsector',
        views: {
          'navbar': APP_SETTINGS.NAVBAR_SETTINGS,
          'main' : {
            templateUrl: 'assets/views/maintenance/assignsector.html',
            controller: 'AssignSectorController',
            controllerAs: 'assignsector',
            resolve: {
              UsersResolve: ['UsersService', function(UsersService){
              return UsersService.getUsers();
            }]
            }
          }
        },
        ncyBreadcrumb: {
          label: 'Asignar Sector'
        }
      })

      .state('measures.changepassword', {
        url:'changepassword',
        views: {
          'navbar': APP_SETTINGS.NAVBAR_SETTINGS,
          'main' : {
            templateUrl: 'assets/views/maintenance/changepassword.html',
            controller: 'ChangePasswordController',
            controllerAs: 'changepassword',
          }
        },
        ncyBreadcrumb: {
          label: 'Cambiar Contraseña'
        }
      })

      .state('measures.changechargeparameters', {
        url: 'changeparameters',
        views: {
          'navbar': APP_SETTINGS.NAVBAR_SETTINGS,
          'main': {
            templateUrl: 'assets/views/maintenance/changechargeparameters.html',
            controller: 'ChangeChargeParametersController',
            controllerAs: 'changeparameters'
          }
        },
        ncyBreadcrumb: {
          label: 'Cambiar Parametros de cobro'
        }
      });
  }

})();