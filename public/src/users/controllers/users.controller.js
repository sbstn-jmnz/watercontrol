(function() {
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .controller('UsersController', Controller);
  
  Controller.$inject = ['$rootScope', '$filter','$timeout', 'UsersResolve'];
  
  /* @ngInject */
  function Controller($rootScope, $filter, $timeout, UsersResolve) {
    
    var vm = this;

    //Variables
    vm.usersList = angular.copy(UsersResolve);
    
    //Funciones


    //Implementaciones
  }
})();