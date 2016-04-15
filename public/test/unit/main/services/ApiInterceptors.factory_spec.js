(function() {
  'use strict';
  
  describe('Api Interceptors',InterceptorsSpec);

  function InterceptorsSpec(){


    var ApiInterceptors,
        AuthService,
        httpBackend,
        scope,
        httpProvider;

    beforeEach(module('CommonMocks'));
    beforeEach(module('MedicionAguaAdmin', function($httpProvider){
      httpProvider = $httpProvider;
    }));

    beforeEach(inject(eachSpec));

    function eachSpec($rootScope, $httpBackend, _ApiInterceptors_, _AuthService_){
      ApiInterceptors = _ApiInterceptors_;
      httpBackend = $httpBackend;
      AuthService = _AuthService_;
    }

    //////////////////   SPECS //////////////////////////////////
    it('1. Debería estar seteado como un interceptor para la aplicacion', spec1);

    function spec1(){
      expect(httpProvider.interceptors).toContain('ApiInterceptors');
    }

    it('2. Deberían estar presente los headers al hacer un request con un token de autorización', inject(spec2));

    function spec2($http) {
      
      httpBackend.expectGET('http://exampleApi.com/')
        .respond(function(method, url, data, headers, params){

          var regexToken = (/(?:^\s*Token\s+token\s*\=\s*)(.+)/g).exec(headers['Authorization'])[1],
              userToken = AuthService.getUser().token;

          expect(headers).toBeDefined();
          expect(headers['Authorization']).toBeDefined();
          expect(regexToken).toEqual(userToken);

          return 'fake response';
        });

      $http.get('http://exampleApi.com/');

      httpBackend.flush();

    }

    
  }


})();