(function(){
  'use strict';

  angular
    .module('MedicionAguaAdmin')
    .config(configFn);

  function configFn($stateProvider, APP_SETTINGS){
    $stateProvider
    
      .state('measures.users', {
        url: 'users',
        views: {
          'navbar': APP_SETTINGS.NAVBAR_SETTINGS,
          'main': {
            templateUrl: 'assets/views/users/users.html',
            controller: 'UsersController',
            controllerAs: 'users',
            resolve: {
              UsersResolve: ['UsersService', function(UsersService){
                return UsersService.getUsers();
              }]
            }
          }
        },
        ncyBreadcrumb: {
          label: 'Usuarios'
        }
      })

      .state('measures.addusers', {
        url: 'adduser',
        views: {
          'navbar': APP_SETTINGS.NAVBAR_SETTINGS,
          'main': {
            templateUrl: 'assets/views/users/addedit.html',
            controller: 'AddEditUsersController',
            controllerAs: 'addeditusers',
            resolve: {
              UserResolve: [function(){
                return {name:'', rut:''};
              }]
            }
          }
        },
        ncyBreadcrumb: {
          label: 'Agregar usuario'
        }
      });
    }


})();


