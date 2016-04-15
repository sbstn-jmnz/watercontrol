(function() {
  'use strict';
  
  describe('MeasureProcesses Controller',measureProcessesSpec);

  function measureProcessesSpec(){

    //////////////  GLOBALS   ////////////////////////////////
    var scope, rootScope, state, MeasureProcessesController, processesList, controllerInjector, httpBackend;
    //////////////  BEFORE EACH ////////////////////////////////
    beforeEach(module('CommonMocks'));
    
    beforeEach(module('MedicionAguaAdmin', provideToSpec));
    
    function provideToSpec($provide, COMMON_MOCKS){
      $provide.value('MeasureProcessesResolve', COMMON_MOCKS.MEASURE_PROCESSES);
      $provide.value('ChargeParametersResolve', COMMON_MOCKS.CHARGE_PARAMETERS);
    }

    beforeEach(inject(eachSpec));
    
    function eachSpec($rootScope, $state, $controller, $httpBackend, MeasureProcessesResolve, COMMON_TASKS){
      rootScope = $rootScope;
      scope = $rootScope.$new();
      state = $state;
      httpBackend = $httpBackend;

      processesList = MeasureProcessesResolve;
      controllerInjector = $controller;
      
      MeasureProcessesController = instanceController($controller, 'MeasureProcessesController');

      COMMON_TASKS.setAppRequests();
    }

    //////////////////// HELPERS   //////////////////
    function instanceController(controllerInjector, _name, args){
      return controllerInjector(_name, args);
    }

    //////////////////   SPECS //////////////////////////////////
    it('1. MeasureProcessesController debería estar definido', spec1);

    function spec1() {
      expect(MeasureProcessesController).toBeDefined();
    }

    it('2. Debería definir que es posible iniciar un proceso si todos los procesos están cerrados', spec2);

    function spec2() {
      //By default the mocks measure processes list have 1 state 'active'
      expect(MeasureProcessesController.closed).toBe(false);

      //Set to 'closed' all processes states
      processesList.map(function(p){
        p.status = 'closed';
        return p;
      });

      MeasureProcessesController = instanceController(controllerInjector, 'MeasureProcessesController', {
        MeasureProcessesResolve : processesList
      });

      expect(MeasureProcessesController.closed).toBe(true);
    }

    it('3. Debería cerrar el proceso una vez iniciado un nuevo proceso', spec3);

    function spec3() {
      
      MeasureProcessesController.close = false;

      MeasureProcessesController.initProcess();
      httpBackend.flush();
      expect(MeasureProcessesController.closed).toBe(true);
    }

    
  }

})();
