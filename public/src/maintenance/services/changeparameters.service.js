(function() {
  'use strict';
  angular
    .module('MedicionAguaAdmin')
    .service('ChangeParametersService', service);
  
  service.$inject = ['APP_SETTINGS', '$resource', 'AuthService'];
  
  /* @ngInject */
  function service(APP_SETTINGS, $resource, AuthService) {
    
    var self = this;

    // self.confMeasuresResource =  $resource(APP_SETTINGS.BASE_URL + '/condos/:condoId/measure_processes', {id:'@id'});
    self.changeParametersResource = $resource(APP_SETTINGS.BASE_URL + '/condos/:condoId/charge_parameters/:option', {condoId: '@condoId', option: '@option'},{
      update: {
        method: 'PATCH'
      }
    });
    self.postParams = postParams;
    self.getParams = getParams;
    // self.initProcess = initProcess;


    //Service implementations
    function postParams(newParams){
      console.log(newParams);
      var selectedCondo = AuthService.getUser().condoSelected;
      // var params = new self.changeParametersResource(newParams);
      return self.changeParametersResource.update({condoId: selectedCondo.id, option: 'update'}, newParams).$promise;
    }

    function getParams(){
      var selectedCondo = AuthService.getUser().condoSelected;
      return self.changeParametersResource.get({condoId: selectedCondo.id}).$promise;
    }

  }

})();