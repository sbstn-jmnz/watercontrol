(function() {
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .controller('AddEditUsersController', Controller);
  
  Controller.$inject = ['$state', 'UserResolve', 'UsersService'];
  
  /* @ngInject */
  function Controller($state, UserResolve, UsersService){
    
    var vm = this;

    vm.addedit = addedit;
    vm.user = angular.copy(UserResolve);

    function addedit(_user){
      if(_user){
        UsersService.createUser(_user).then(function(){
          $state.go('measures.users');
        });
      }
    }
  }
})();