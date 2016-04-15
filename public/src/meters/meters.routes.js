(function(){
  'use strict';

  angular
    .module('MedicionAguaAdmin')
    .config(function($stateProvider, APP_SETTINGS){
      $stateProvider
        .state('measures.meters', {
          url:'meters',
          views: {
            'navbar': APP_SETTINGS.NAVBAR_SETTINGS,
            'main' : {
              templateUrl: 'assets/views/meters/meters.html',
              controller: 'MetersController',
              controllerAs: 'meters',
              resolve: {

              }
            }
          },
          ncyBreadcrumb: {
            label: 'Medidores'
          }
        })

    })
})();