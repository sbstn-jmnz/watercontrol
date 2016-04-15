(function() {
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .controller('SectorsController', Controller);
  
  Controller.$inject = ['$rootScope', '$scope', '$state', '$filter', 'CondoSelected', 'CondosService'];
  
  /* @ngInject */
  function Controller($rootScope, $scope,  $state, $filter, CondoSelected, CondosService) {
    
    var vm = this;

    vm.condoSelected = angular.copy(CondoSelected);
    vm.sectorsList = vm.condoSelected.sectors;

    vm.selectedCondoId = vm.condoSelected.id;
    vm.selectedSectorId = vm.sectorsList[0].id;
    vm.plotsList = vm.sectorsList[0].plots;

    vm.loadSectors = loadSectors;
    vm.loadPlots = loadPlots;
    vm.searchPlot = search;
    vm.plotGo = plotGo;

    $scope.$on('change:condo', loadSectors);

    function loadSectors(event, args){
      
      vm.selectedCondoId = args? args.condoId
                               : vm.selectedCondoId;

      //Activar spinner en tabla
      $rootScope.$broadcast('open:spinner');

      CondosService.getCondo(vm.selectedCondoId).then(function(response){
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