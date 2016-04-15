(function() {
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .controller('MainController', Controller);
  
  Controller.$inject = ['$scope'];
  
  /* @ngInject */
  function Controller($scope) {
    
    var vm = this;

    vm.spinnerOpened = false;
    
    $scope.$on('open:spinner', openSpinner);
    $scope.$on('close:spinner', closeSpinner);

    function openSpinner(){
      vm.spinnerOpened = true;
    }

    function closeSpinner(){
      vm.spinnerOpened = false;
    }

  }
})();