(function() {
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .controller('MeasureProcessesController', Controller);
  
  Controller.$inject = ['MeasureProcessesResolve', 'MeasureProcessesService', 'APP_SETTINGS', 'ChargeParametersResolve'];
  
  /* @ngInject */
  function Controller(MeasureProcessesResolve, MeasureProcessesService, APP_SETTINGS, ChargeParametersResolve) {
    
    var vm = this;

    vm.measureProcesses = angular.copy(MeasureProcessesResolve);
    vm.closed = checkActiveProcesses(vm.measureProcesses);
    vm.chargeparameters = angular.copy(ChargeParametersResolve);
    //Variables
    //vm
    
    //Funciones
    vm.initProcess = initProcess;
    vm.closeProcess = closeProcess;
    
    //Implementaciones
    function checkActiveProcesses(_processes){
      return _processes.filter(function(p){
        return p.status ===  APP_SETTINGS.MEASURE_PROCESSES_STATUS.ACTIVE;
      }).length > 0? false : true;
    }

    function initProcess(){
      MeasureProcessesService.initProcess().then(function(updatedProcesses){
        //reload Process
        vm.measureProcesses = updatedProcesses;
        vm.closed = checkActiveProcesses(vm.measureProcesses);
      });
    }

    function closeProcess(){

      var targetProcess = vm.measureProcesses.filter(function(p){
        return p.status ===  APP_SETTINGS.MEASURE_PROCESSES_STATUS.ACTIVE;
      })[0];

      MeasureProcessesService.closeProcess(targetProcess.id).then(function(updatedProcesses){
        //reload Process
        vm.measureProcesses = updatedProcesses;
        vm.closed = checkActiveProcesses(vm.measureProcesses);
      });
    
    }

  }
})();