(function() {
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .controller('LoginController', Controller);
  
  Controller.$inject = ['$state'];
  
  /* @ngInject */
  function Controller($state) {
    
    var vm = this;

    vm.user = {
      email: '',
      password: ''
    };

    vm.loginGo = login;

    function login(_user){
      $state.go('measures.home');
    }

  }
})();