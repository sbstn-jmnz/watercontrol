(function() {
  'use strict';
  angular
    .module('MedicionAguaAdmin')
    .service('MeasureProcessesService', service);
  
  service.$inject = ['$q','APP_SETTINGS', '$resource', 'AuthService'];
  
  /* @ngInject */
  function service($q, APP_SETTINGS, $resource, AuthService) {
    
    var self = this;

    self.confMeasuresResource =  $resource(APP_SETTINGS.BASE_URL + '/condos/:condoId/measure_processes/:id/:option', {id:'@id', condoId:'@condoId', option: '@option'});
    
    self.getConfig = getConfig;
    self.initProcess = initProcess;
    self.closeProcess = closeProcess;


    //Service implementations
    function resolveProcess(response){
      return response.toJSON();
    }

    function getConfig() {
      var selectedCondo = AuthService.getUser().condoSelected;
      return self.confMeasuresResource.query({condoId: selectedCondo.id}).$promise;
    }

    function initProcess(){
      var selectedCondo = AuthService.getUser().condoSelected,
          process = new self.confMeasuresResource({});
      
      return process.$save({condoId: selectedCondo.id})
              .then(getConfig);
    }

    function closeProcess(_processId){
      var selectedCondo = AuthService.getUser().condoSelected,
          process = new self.confMeasuresResource({});
      
      return process.$save({id: _processId, condoId: selectedCondo.id, option: 'close'})
              .then(getConfig);
    }



  }

})();