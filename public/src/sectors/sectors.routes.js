(function(){
  
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .config(configFn);

  configFn.$inject = ['$stateProvider', 'APP_SETTINGS'];

  function configFn($stateProvider, APP_SETTINGS){
      
    var mainViewConf = {
      templateUrl: 'assets/views/sectors/sectors.html',
      controller: 'SectorsController',
      controllerAs: 'sectors',
      resolve: {
        // CondosResolve: ['CondosService', function(CondosService){
        //   return CondosService.getCondos();
        // }],
        CondoSelected: ['AuthService','CondosService', function(AuthService, CondosService){
 
          var condoId = AuthService.getUser().condoSelected.id;
          return CondosService.getCondo(condoId).then(function(response){
            return response.toJSON();
          });
        }]
      }
    };

    $stateProvider
      .state('measures.sectors',{
        url:'sectors',
        views: {
          'navbar': APP_SETTINGS.NAVBAR_SETTINGS,
          'main' : mainViewConf
        },
        ncyBreadcrumb: {
          label: 'Parcelas'
        }
      });
  }

})();