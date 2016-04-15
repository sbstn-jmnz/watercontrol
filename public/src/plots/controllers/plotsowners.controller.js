(function() {
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .controller('PlotsOwnersController', Controller);
  
  Controller.$inject = ['$rootScope', '$state', '$filter','CondosResolve', 'CondoSelected', 'CondosService'];

  function Controller($rootScope, $state, $filter, CondosResolve, CondoSelected, CondosService) {
    
    var vm = this;

    vm.plotsOwners = [  
      {rut: "1.222.333-4", nombre: "Viviana Costa Gonzales"},
      {rut: "2.333.444-5", nombre: "Patricio Rojas Albornoz"},
      {rut: "3.444.555-6", nombre: "Luis Bastidas Fenr"},
      {rut: "4.555.666-7", nombre: "Omar Reyes Quijada"}
    ];

    vm.condosList = angular.copy(CondosResolve);
    vm.condoSelected = angular.copy(CondoSelected);
    vm.sectorsList = vm.condoSelected.sectors;

    vm.selectedCondoId = vm.condoSelected.id;
    vm.selectedSectorId = vm.sectorsList[0].id;
    vm.plotsList = vm.sectorsList[0].plots;

    vm.loadSectors = loadSectors;
    vm.loadPlots = loadPlots;
    vm.searchPlot = search;
    vm.plotGo = plotGo;

    function loadSectors(_condoId){
      
      //Activar spinner en tabla
      $rootScope.$broadcast('open:spinner');
      
      CondosService.getCondo(_condoId).then(function(response){
        var condo = response.toJSON();
        
        vm.condoSelected = condo;
        vm.sectorsList = vm.condoSelected.sectors;
        vm.selectedSectorId = vm.sectorsList[0].id;
        vm.plotsList = vm.sectorsList[0].plots;

        //desactivar spinner en tabla
        $rootScope.$broadcast('close:spinner');
      });
    }

    function loadPlots(_sectorId){
      vm.plotsList = pickPlot(_sectorId);
    }

    function pickPlot(_sectorId){
      return vm.sectorsList.filter(function(sector){
        return sector.id === _sectorId;
      })[0].plots;
    }

    function search(_searchString){

      vm.plotsList = _searchString? $filter('filter')(vm.plotsList, {plot_number: _searchString})
                                  : pickPlot(vm.selectedSectorId);
    }

    function plotGo(_plotId){
      $state.go('measures.plot', {id: _plotId});
    }
    

  }
})();