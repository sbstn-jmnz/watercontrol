(function(){
  'use strict';

  angular
    .module('MedicionAguaAdmin')
    .controller('NavbarController', Controller);

  Controller.$inject = ['$rootScope','$state', 'AuthService', 'APP_SETTINGS'];

  /* @ngInject */
  function Controller($rootScope, $state, AuthService, APP_SETTINGS){
    var vm = this;

    vm.checkState = checkState;
    vm.userLogged = AuthService.getUser();
    vm.showCondos = vm.userLogged.role === APP_SETTINGS.PROFILE_ROLES.SUPERADMIN? true
                                                                                : false;
    vm.selectedCondo = vm.userLogged.condoSelected;
    vm.changeCondo = changeCondo;

    function checkState(_statename){
      return $state.is(_statename);
    }

    function changeCondo(_condoId){

      vm.userLogged.condoSelected = vm.userLogged.condos_assigned.filter(function(condo){
        return condo.id === _condoId;
      })[0];

      AuthService.setUser(vm.userLogged);

      if($state.current.name === 'measures.sectors'){
        $rootScope.$broadcast('change:condo', {condoId: _condoId});
      }
    
    }

  }
})();