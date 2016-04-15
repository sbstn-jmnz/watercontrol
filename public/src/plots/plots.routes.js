(function(){
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .config(configFn);

  function configFn($stateProvider, APP_SETTINGS){
      
    var mainViewConf = {
      templateUrl: 'assets/views/plots/plot.html',
      controller: 'PlotController',
      controllerAs: 'plot',
      resolve: {
        PlotResolve: ['PlotsService','$stateParams', function(PlotsService, $stateParams){
          return PlotsService.getPlot($stateParams.id).then(function(plot){
            return plot.toJSON();
          });
        }]
      }
    },

    plotMeasuresConf = {

      templateUrl: 'assets/views/plots/plotMeasures.html',
      controller: 'PlotMeasuresController',
      controllerAs: 'plotMeasures',
      resolve: {
        PlotMeausures: ['PlotsMeasureService','$stateParams', function(PlotsMeasureService, $stateParams){
          return PlotsMeasureService.getPlotMeasures($stateParams.meterId).then(function(plot){
            return plot.toJSON();
          });
        }]
      }

    };

    var plotsOwnersConf = {
      templateUrl: 'assets/views/plots/plotsowners.html',
      controller: 'PlotsOwnersController',
      controllerAs: 'plotsowners',
      resolve: {
        CondosResolve: ['CondosService', function(CondosService){
          return CondosService.getCondos();
        }],
        CondoSelected: ['CondosResolve', 'CondosService', function(CondosResolve, CondosService){
          //ESTE ID LUEGO DEBE OBTENERSE DEL CONDOMINIO QUE TIENE ASIGNADO EL USUARIO LOGGEADO
          var condoId = CondosResolve[0].id;
          return CondosService.getCondo(condoId).then(function(response){
            return response.toJSON();
          });
        }]
      }
    };

    var setPlotOwnersConf = {
      templateUrl: 'assets/views/plots/setplotowners.html',
      controller: 'SetPlotsOwnersController',
      controllerAs: 'setplotsowners',
      resolve: {
        PlotResolve: ['PlotsService', '$stateParams', function(PlotsService, $stateParams){
          return PlotsService.getPlot($stateParams.id).then(function(response){
            return response.toJSON();
          });
        }]
      }
    };

    $stateProvider
      .state('measures.plot',{
        url:'plots/:id',
        views: {
          'navbar': APP_SETTINGS.NAVBAR_SETTINGS,
          'main' : mainViewConf
        },
        ncyBreadcrumb: {
          parent: 'measures.sectors',
          label: 'Parcela Nº {{actualPlotNavigation}}'
        }
      })


      .state('measures.plotsowners', {
        url: 'plotsowners',
        views: {
          'navbar': APP_SETTINGS.NAVBAR_SETTINGS,
          'main': plotsOwnersConf
        },
        ncyBreadcrumb:{
          label: 'Asignar dueños de parcelas'
        }
      })

      .state('measures.setplotowners',{
        url: 'setplotowners/:id',
        views: {
          'navbar': APP_SETTINGS.NAVBAR_SETTINGS,
          'main': setPlotOwnersConf
        },
        ncyBreadcrumb: {
          parent: 'measures.plotsowners',
          label: 'Dueño parcela N°{{setplotsowners.selectedPlotId}}'
        }
      })

      .state('measures.plotMeasures', {
        url:'meters/:meterId',
        views: {
          'navbar': APP_SETTINGS.NAVBAR_SETTINGS,
          'main': plotMeasuresConf
        },

        ncyBreadcrumb: {
          parent: 'measures.plot',
          label: 'Mediciones'
        }
      });
    
  }
})();
