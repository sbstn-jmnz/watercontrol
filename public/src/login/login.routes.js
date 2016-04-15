(function(){
  'use strict';

  angular
    .module('MedicionAguaAdmin')
    .config(configFn);

  configFn.$inject = ['$stateProvider'];

  function configFn($stateProvider){
    $stateProvider
      .state('measures.login',{
        url:'login',
        views: {
          'main' : {
            templateUrl: 'assets/views/login/login.html',
            controller: 'LoginController',
            controllerAs: 'login'
          }
        }
      });
    }

})();


