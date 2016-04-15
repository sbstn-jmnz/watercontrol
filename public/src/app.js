(function() {
  
  'use strict';

  angular
    .module('MedicionAguaAdmin', [
      'ngAnimate',
      'ui.router',
      'angularSpinner',
      'ngResource',
      'ngMessages',
      'gp.rutValidator',
      'ncy-angular-breadcrumb',
      'ui.select',
      'ngSanitize'
    ]);

  angular
    .module('MedicionAguaAdmin')
    .constant('APP_SETTINGS', {
      
      NAVBAR_SETTINGS: {
        templateUrl: 'assets/views/navbar/navbar.html',
        controller: 'NavbarController',
        controllerAs: 'navbar'
      },
      
      SPINNER_SETTINGS: {
        color:'#FFFFFF',
        radius:30,
        width:8,
        length: 16,
        top: '30%'
      },
      
      //http://192.168.0.95:3000/webapp
      //api.watercontrol-dev.com:3000/webapp
      BASE_URL: 'http://api.watercontrol-dev.com:3000/webapp',

      PROFILE_ROLES: {
        ADMIN: 'admin',
        SUPERADMIN: 'superadmin',
        USER: 'user'
      },

      MEASURE_PROCESSES_STATUS : {
        ACTIVE: 'active',
        CLOSES: 'closed'
      }


    });

  /*
    CONFIGURACIÓN GENERAL DE LA APLICACIÓN: CONFIGURACIÓN 
  */
  angular
    .module('MedicionAguaAdmin')
    .config(configFn);

  configFn.$inject = ['$httpProvider', '$stateProvider', '$urlRouterProvider', 'usSpinnerConfigProvider', '$breadcrumbProvider','APP_SETTINGS'];

  function configFn($httpProvider, $stateProvider, $urlRouterProvider, usSpinnerConfigProvider, $breadcrumbProvider, APP_SETTINGS){
    
    $httpProvider.interceptors.push('ApiInterceptors');

    usSpinnerConfigProvider
      .setTheme('mainSpinner', APP_SETTINGS.SPINNER_SETTINGS);

    $urlRouterProvider.otherwise('/sectors');
    
    $stateProvider
      .state('measures',{
        url: '/',
        abstract: true,
        templateUrl: 'assets/views/main/main.html',
        controller: 'MainController',
        controllerAs: 'main',
        ncyBreadcrumb: {
          label: 'Mediciones'
        }
      });

    $breadcrumbProvider
      .setOptions({
        template: 'bootstrap3',
        includeAbstract: true
      });
  }

  /*
    CONFIGURACIÓN GENERAL DE SERVICIOS Y EVENTOS
  */

  angular
    .module('MedicionAguaAdmin')
    .run(runFn);

  runFn.$inject = ['$state', '$rootScope', 'AuthService'];
  
  function runFn($state, $rootScope, AuthService) {
    
    AuthService.login({});

    $rootScope.$on('$stateChangeStart', function(e, toState, toParams, fromState, fromParams) {
      
      if(!fromState.name && (toState.name === 'measures.plot' || toState.name === 'measures.plotMeasures' )){
        $state.go('measures.sectors');
      }
      
      else if(fromState.name && toState.name === 'measures.plot')  {
        $rootScope.actualPlotNavigation = toParams.id;
      }

    });
  }

})();