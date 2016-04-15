(function() {
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .service('PlotsMeasureService', service);
  
  service.$inject = ['$q','APP_SETTINGS', '$resource'];
  
  /* @ngInject */
  function service($q, APP_SETTINGS, $resource) {
    
    var self = this;

    self.metersResource =  $resource(APP_SETTINGS.BASE_URL + '/meters/:id', {id:'@id'});

    self.getPlotMeasures = getPlotMeasures;
    
    //Service implementations
  
    function getPlotMeasures(_meterId) {
      return self.metersResource.get({id: _meterId }).$promise;
    }

  }
})();