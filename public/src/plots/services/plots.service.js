(function() {
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .service('PlotsService', service);
  
  service.$inject = ['$q','APP_SETTINGS', '$resource'];
  
  /* @ngInject */
  function service($q, APP_SETTINGS, $resource) {
    
    var self = this;

    self.plotsResource =  $resource(APP_SETTINGS.BASE_URL + '/plots/:id', {id:'@id'});

    self.getPlot = getPlot;
    
    //Service implementations
    function rejectResponse(){
      var defer = $q.defer();
      defer.reject({error: 'Falta id para el endpoint /plots.'});
      return defer.promise;
    }

    function getPlot(_plotId) {
      return _plotId? self.plotsResource.get({id: _plotId }).$promise
                    : rejectResponse();
    }

  }
})();