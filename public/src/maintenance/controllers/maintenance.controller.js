(function() {
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .controller('MaintenanceController', Controller);
  
  Controller.$inject = ['$rootScope', '$filter','$timeout', 'CondosResolve', 'PeriodsResolve', 'ConfigurationResolve'];
  
  /* @ngInject */
  function Controller($rootScope, $filter, $timeout, CondosResolve, PeriodsResolve, ConfigurationResolve) {
    
    var vm = this;

    //Variables
    vm.condosList = angular.copy(CondosResolve);
    vm.periodsList = angular.copy(PeriodsResolve);
    vm.configuration = angular.copy(ConfigurationResolve);
    vm.selectedCondo = vm.condosList[0].id;
    
    //Funciones
    


    //Implementaciones
    
  }
})();