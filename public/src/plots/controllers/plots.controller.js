(function() {
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .controller('PlotController', Controller);
  
  Controller.$inject = ['$state','PlotResolve'];
  
  function Controller($state, PlotResolve) {
    var vm = this;

    vm.plotSelected = angular.copy(PlotResolve);
    vm.goPlotMeasures = goPlotMeasures;

    function goPlotMeasures(_meterId){
      $state.go('measures.plotMeasures', {meterId: _meterId});
    }

  }
})();