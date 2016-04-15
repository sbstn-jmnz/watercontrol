(function(){

  'use strict';

  describe('Plots Service',plotSpecs);

  function plotSpecs(){

    var PlotsService,
        httpBackend,
        scope;

    //BEFORE EACH
    beforeEach(module('CommonMocks'));
    beforeEach(module('MedicionAguaAdmin'));

    beforeEach(inject(eachSpec));

    function eachSpec($rootScope, $httpBackend, _PlotsService_, COMMON_TASKS){
      scope = $rootScope.$new();
      httpBackend = $httpBackend;
      PlotsService = _PlotsService_;

      COMMON_TASKS.setAppRequests();
    }

    //SPECS
    it('1. Debería obtener un objeto parcela con id numérico y una lista de medidores', spec1);

    function spec1(){
      var plotId = 4;

      PlotsService.getPlot(plotId).then(function(plot){
        expect(_.isNumber(plot.id)).toBe(true);
        expect(_.isArray(plot.meters)).toBe(true);
      });
      httpBackend.flush();
    }

    it('2. Debería fallar si al obtener una parcela no se provee el id al endpoint /plots', spec2);

    function spec2(){
      
      PlotsService.getPlot()
        .catch(function(error){
          expect(error['error']).toBeDefined();
          expect(error['error']).not.toEqual('');
        });

      scope.$digest();
      
    }

  }

})();