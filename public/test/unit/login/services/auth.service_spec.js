(function() {
  'use strict';
  
  describe('Auth Service', AuthSpec);

  function AuthSpec(){

    var AuthService,
        httpBackend,
        availableRoles;

    beforeEach(module('CommonMocks'));
    beforeEach(module('MedicionAguaAdmin'));

    beforeEach(inject(function($httpBackend, COMMON_TASKS, _AuthService_, APP_SETTINGS){
      
      AuthService = _AuthService_;
      httpBackend  = $httpBackend;
      availableRoles = Object.keys(APP_SETTINGS.PROFILE_ROLES).map(function(key){return APP_SETTINGS.PROFILE_ROLES[key];});
      //Set all url's that the service sets using $http
      //this.httpBackend.whenGET(condosUrlRegex).respond(COMMON_MOCKS.CONDOS);
    }));


    it('1. AuthService debería estar definido', spec1);

    function spec1(){
      expect(AuthService).toBeDefined();
    }

    it('2. Debería obtener un usuario con un rol de usuario, un token y un array de condominios asignados a su rol', spec2);

    function spec2(){
      
      var user = {email: 'a@a.cl', password:'123'},
          userResponse,
          checkRole;

      AuthService.login(user);

      userResponse = AuthService.getUser();
      checkRole = availableRoles.indexOf(userResponse.role);

      expect(checkRole).not.toEqual(-1);
      expect(userResponse.token).toBeDefined();
      expect(_.isArray(userResponse.condos_assigned)).toBe(true);
    }

    it('3. Al hacer login debería poder obtener el usuario mediante getUser', spec3);

    function spec3(){
      
      AuthService.login({email: 'a@a.cl', password:'123'});

      expect(AuthService.getUser()).not.toBeNull();
    }

  }

})();