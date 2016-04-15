(function() {
  'use strict';
  
  describe('Maintenance Controller', maintenanceSpec);

  function maintenanceSpec(){

    //////////////  GLOBALS   ////////////////////////////////
    var MaintenanceController, state, scope;
    //////////////  BEFORE EACH ////////////////////////////////
    beforeEach(module('CommonMocks'));
    beforeEach(module('MedicionAguaAdmin',function($provide, COMMON_MOCKS){
      
      $provide.value('CondosResolve', COMMON_MOCKS.CONDOS);
      $provide.value('PeriodsResolve', COMMON_MOCKS.PERIODS);
      $provide.value('ConfigurationResolve', COMMON_MOCKS.CONF);
    
    }));

    beforeEach(inject(eachSpec));

    function eachSpec($state, $rootScope, $controller ){
      state = $state;
      scope = $rootScope.$new();

      MaintenanceController = $controller('MaintenanceController');
    }

    //////////////////   SPECS //////////////////////////////////
    it('1. MaintenanceController deberia estar definido', spec1);

    function spec1() {
      expect(MaintenanceController).toBeDefined();
    }

    it('2. Debería recibir un array de parcelas', spec2);

    function spec2() {
      expect(MaintenanceController).toBeDefined();
    }

    it('3. Deberia recibir un array de periodos vigentes', spec3);

    function spec3() {
      expect(_.isArray(MaintenanceController.periodsList)).toBe(true);
    }

    it('4. Deberia recibir un array de configuración según periodo', spec4);

    function spec4() {
      expect(_.isArray(MaintenanceController.configuration)).toBe(true);
    }
 
  }

})();