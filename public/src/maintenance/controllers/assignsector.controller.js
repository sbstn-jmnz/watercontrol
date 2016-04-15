(function() {
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .controller('AssignSectorController', Controller);
  
  Controller.$inject = ['UsersResolve'];
  
  /* @ngInject */
  function Controller(UsersResolve) {
    
    var vm = this;

    //Variables
    vm.usersList = angular.copy(UsersResolve);
    console.log(UsersResolve);
    vm.selectedUserId = vm.usersList[0].id;
    
    //Funciones
    


    //Implementaciones
    
  }
})();