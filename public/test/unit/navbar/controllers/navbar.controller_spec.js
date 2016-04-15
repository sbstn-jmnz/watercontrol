(function() {
  'use strict';
  
  describe('Navbar Controller',descriptionSpec);

  function descriptionSpec(){

    //////////////  GLOBALS   ////////////////////////////////
    var NavbarController,
        state,
        location,
        httpBackend,
        rootScope;
    //////////////  BEFORE EACH ////////////////////////////////
    beforeEach(module('CommonMocks'));
    beforeEach(module('MedicionAguaAdmin', function($provide, COMMON_MOCKS){
      
      $provide.value('CondoSelected', COMMON_MOCKS.CONDO);

    }));

    beforeEach(inject(eachSpec));

    function eachSpec($controller, $httpBackend,$rootScope, $state, COMMON_TASKS){
      state = $state;
      rootScope = $rootScope;
      httpBackend = $httpBackend;
      NavbarController = $controller('NavbarController');
      //Set the expects for the calls in somewhere when we change the states of the app
      COMMON_TASKS.setAppRequests();
    }

    //////////////////   SPECS //////////////////////////////////
    it('1. Debería estar presente en todos los estados excepto en el estado login', spec1);

    function spec1() {
      state.go('measures.users');//This generates a request to server, we need flushing it.
      httpBackend.flush(); //The resolve for 'measures.users' it's done;
      
      expect(state.current.views['navbar']).toBeDefined();
      expect(state.current.views['navbar'].controller).toEqual('NavbarController');
      expect(state.current.views['navbar'].controllerAs).toEqual('navbar');

      state.go('measures.sectors');
      httpBackend.flush();

      expect(state.current.views['navbar']).toBeDefined();
      expect(state.current.views['navbar'].controller).toEqual('NavbarController');
      expect(state.current.views['navbar'].controllerAs).toEqual('navbar');

      //login state don't resolve promises in the backend, therefore we won't need flush httpBackend.
      //However the state servide should be updated via rootScope.$digest()
      state.go('measures.login');
      rootScope.$digest();

      expect(state.current.views['navbar']).not.toBeDefined();
    }

    it('2. Debería Estar presente el usuario logeado', spec2);

    function spec2(){
      expect(NavbarController.userLogged).not.toBeNull();
    }

    it('3. Debería poder reconocer el estado/ruta actual', spec3);

    function spec3(){

      state.go('measures.users');
      httpBackend.flush();
      
      expect(NavbarController.checkState(state.current.name)).toBe(true);
    }

    it('4. Debería emitir un evento "change:condo" cuando se seleccione un nuevo condominio y estamos en el estado "measures.sectors"', spec4);

    function spec4(){
      var condoId = 1,
        broadcastSpy;

      state.go('measures.sectors');
      httpBackend.flush();
      broadcastSpy = spyOn(rootScope, '$broadcast');

      NavbarController.changeCondo(condoId);

      expect(broadcastSpy).toHaveBeenCalledWith('change:condo',{condoId: condoId});
      //Investigar como no sobreescribir rootScope al aplicarle un spy

    }


  
  }


})();