(function() {
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .controller('PlotMeasuresController', Controller);
  
  Controller.$inject = ['PlotMeausures'];
  
  function Controller(PlotMeausures) {
    var vm = this;

    vm.plotMeasures = angular.copy(PlotMeausures);

  }
})();