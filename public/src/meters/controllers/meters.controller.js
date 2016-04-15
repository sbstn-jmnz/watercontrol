(function() {
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .controller('MetersController', Controller);
  
  Controller.$inject = [];
  
  /* @ngInject */
  function Controller() {
    
    var vm = this;
    //Variables
    vm.metersList = [
      {
        nsitio: 5,
        ubicacion: 'Campo Mar',
        propietario: 'Orlando Diaz Romero' ,
        anterior: 1491, 
        actual: 1546,
        consumototal: 55,
        nmedidor: 50354,
        estadomedidor: 'Activo',
      },
      {
        nsitio: 26,
        ubicacion: 'Campo Mar',
        propietario: 'Macarena Renard Merino' ,
        anterior: 1496, 
        actual: 1551,
        consumototal: 55,
        nmedidor: 53514,
        estadomedidor: 'Activo',
      },
      {
        nsitio: 6,
        ubicacion: 'Campo Mar',
        propietario: 'Patricia Nuñez' ,
        anterior: 2236, 
        actual: 2237,
        consumototal: 1,
        nmedidor: 45213,
        estadomedidor: 'Activo',
      },
      {
        nsitio: 38,
        ubicacion: 'Campo Mar',
        propietario: 'Graciela Mateo Sepulveda' ,
        anterior: 1145, 
        actual: 1186,
        consumototal: 41,
        nmedidor: 42351,
        estadomedidor: 'Activo',
      }
    ]
    //Funciones

    //Implementaciones


  }
})();