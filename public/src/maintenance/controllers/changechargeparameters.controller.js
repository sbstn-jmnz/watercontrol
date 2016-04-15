(function(){
  'use strict';

  angular
    .module('MedicionAguaAdmin')
    .controller('ChangeChargeParametersController', controller);

  controller.$inject = ['$state', 'APP_SETTINGS', 'ChangeParametersService'];

  /* @ngInject */
  function controller($state, APP_SETTINGS, ChangeParametersService){
    var vm = this;

    vm.saveChanges = saveChanges;



    function saveChanges(newParams){
      // console.log(newParams);
      ChangeParametersService.postParams(newParams).then(function(response){
        $state.go('measures.measureProcesses');
      });
    }

  }
})();