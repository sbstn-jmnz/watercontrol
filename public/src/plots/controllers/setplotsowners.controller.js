(function() {
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .controller('SetPlotsOwnersController', Controller);
  
  Controller.$inject = ['$scope', '$rootScope', '$state', '$filter', 'PlotResolve'];

  function Controller($scope, $rootScope, $state, $filter, PlotResolve) {
    
    var vm = this;

    vm.plotsOwners = [  
      {id: 1, rut: "1.222.333-4", nombre: "Viviana Costa Gonzales"},
      {id: 10, rut: "2.333.444-5", nombre: "Patricio Rojas Albornoz"},
      {id: 3, rut: "3.444.555-6", nombre: "Luis Bastidas Fenr"},
      {id: 4, rut: "4.555.666-7", nombre: "Omar Reyes Quijada"},
      {id: 2, rut: "16.299.222-8", nombre: "Gonzalo"},
      {id: 2, rut: "15.316.349-9", nombre: "Seba"},
      {id: 2, rut: "1.111.111-1", nombre: "Jenny"}
    ];


    vm.selectedPlotId = $state.params.id;
    vm.plot = angular.copy(PlotResolve);
    
    vm.selected = { value: vm.plotsOwners[vm.plotsOwners.map(function(e){return e.rut;}).indexOf(vm.plot.owner.rut)] };


  }
})();