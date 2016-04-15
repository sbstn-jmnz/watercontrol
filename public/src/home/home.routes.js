(function(){
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .config(function($stateProvider, APP_SETTINGS){
      $stateProvider
        .state('measures.home',{
          url:'home',
          views: {
            'navbar': APP_SETTINGS.NAVBAR_SETTINGS,
            'main' : {
              templateUrl: 'assets/views/home/home.html',
              controller: 'HomeController',
              controllerAs: 'home',
             
            }
          },
          ncyBreadcrumb: {
            label: 'Home page'
          }
        })
    })
})();

