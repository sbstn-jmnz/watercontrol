(function(){

  'use strict';

  describe('Plot Controller',plotSpecs);

  function plotSpecs(){

    //////////////  GLOBALS   ////////////////////////////////
    var PlotResolve,
        PlotController;

    //////////////  BEFORE EACH ////////////////////////////////
    beforeEach(module('CommonMocks'));
    beforeEach(module('MedicionAguaAdmin', provideToSpec));

    function provideToSpec($provide, COMMON_MOCKS){
      $provide.value('PlotResolve', COMMON_MOCKS.PLOT);
    }

    beforeEach(inject(eachSpec));

    function eachSpec($controller, _PlotResolve_){
      PlotResolve = _PlotResolve_;
      PlotController = $controller('PlotController');
    }

    //////////////////   SPECS //////////////////////////////////
    it('1. PlotsController deberia estar definido', spec1);

    function spec1() {
      expect(PlotController).toBeDefined();
    }
    
  }

})();