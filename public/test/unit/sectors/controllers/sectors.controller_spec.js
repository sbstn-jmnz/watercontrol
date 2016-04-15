(function() {
  'use strict';
  
  describe('Sectors Controller', sectorsSpec);

  function sectorsSpec(){

    //////////////  GLOBALS   ////////////////////////////////
    var SectorsController,
        CondosService,
        state,
        rootScope,
        scope;
    //////////////  BEFORE EACH ////////////////////////////////
    beforeEach(module('CommonMocks'));
    beforeEach(module('MedicionAguaAdmin', function($provide, COMMON_MOCKS){
      
      $provide.value('CondoSelected', COMMON_MOCKS.CONDO);

    }));

    beforeEach(inject(eachSpec));

    function eachSpec($injector, $rootScope, $controller, $state, COMMON_TASKS){
 
      state = $state;
      rootScope = $rootScope;
      scope = $rootScope.$new();
      
      CondosService = $injector.get('CondosService');

      SectorsController = $controller('SectorsController', {
        $scope : scope
      });

      
      COMMON_TASKS.setAppRequests();

    }
    //////////////////   SPECS //////////////////////////////////
    it('1. Sectors Controller deberia estar definido', spec1);

    function spec1() {
      expect(SectorsController).toBeDefined();
    }

    it('2. Debería recibir un array de sectores', spec2);

    function spec2(){
      expect(_.isArray(SectorsController.plotsList)).toBe(true);
    }
    
    it('3. Debería filtrar por número de propiedad al escribir sobre el buscador', spec3);

    function spec3(){

      var sourceList = angular.copy(SectorsController.plotsList);
      //Test 1
      SectorsController.searchPlot('2');

      expect(SectorsController.plotsList).toEqual([
        { id:2,
          plot_number:"2",
          meters:[
            { id:2,
              number:"102",
              state:"active",
              last_measure:{
                id:20,
                value:1000,
                created_at:"2016-03-24T12:25:07.098Z",
                comment:"blah blah"
              },
              last_measurer:"Jenny"}]
        }
      ]);

      //Test 2
      SectorsController.plotsList = sourceList;
      SectorsController.searchPlot('10');

      expect(SectorsController.plotsList).toEqual([]);
    }

    it('4. Al buscar un string "vacío" sobre el buscador debería mostrar la lista original de parcelas', spec4);

    function spec4(){

      var sourceList = angular.copy(SectorsController.plotsList);
      //Test 1
      SectorsController.searchPlot('1');
      expect(SectorsController.plotsList).toEqual([]);

      SectorsController.searchPlot('');
      expect(SectorsController.plotsList).toEqual(sourceList);

    }

    it('5. Debería redirigir al estados "measures.plot" al seleccionar una parcela y ver detalles', spec5);

    function spec5(){

      var selectedPlotId = SectorsController.plotsList[0].id,
          redirect = spyOn(state, 'go');
      
      SectorsController.plotGo(selectedPlotId);
      expect(redirect).toHaveBeenCalledWith('measures.plot',{id: selectedPlotId});
    }

    it('6. Debería escuchar el evento "change:condo" y recargar los sectores', spec6);

    function spec6(){
      var called = false,
          sendData = {condoId: 12345},
          actualSelectedCondoId;

      //Test 1
      rootScope.$broadcast('change:condo', sendData);
      expect(SectorsController.selectedCondoId).toEqual(sendData.condoId);
      
      //Test 2
      actualSelectedCondoId = SectorsController.selectedCondoId;
      sendData = null;
      rootScope.$broadcast('change:condo', sendData);
      expect(SectorsController.selectedCondoId).toEqual(actualSelectedCondoId);

    }

    
  }

})();