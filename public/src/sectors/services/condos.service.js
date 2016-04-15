(function() {
  'use strict';
  angular
    .module('MedicionAguaAdmin')
    .service('CondosService', service);
  
  service.$inject = ['APP_SETTINGS', '$resource'];
  
  /* @ngInject */
  function service(APP_SETTINGS, $resource) {
    var self = this,
        condosResourceUrl = APP_SETTINGS.BASE_URL + '/condos/:id';

    self.condosResource =  $resource(condosResourceUrl, {id:'@id'});

    self.getCondos = getCondos;
    self.getCondo = getCondo;
    
    //Service implementations
    function getCondos() {
      return self.condosResource.query().$promise;
    }
    function getCondo(_id){
      return self.condosResource.get({id: _id}).$promise;
    }

  }
})();