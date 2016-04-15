(function() {
  'use strict';
  
  describe('Login Controller', loginSpec);

  function loginSpec(){

    //////////////  GLOBALS   ////////////////////////////////
    
    //////////////  BEFORE EACH ////////////////////////////////
    beforeEach(module('MedicionAguaAdmin'));

    beforeEach(inject(eachSpec));

    function eachSpec(){
    }

    //////////////////   SPECS //////////////////////////////////
    it('spec', spec1);

    function spec1() {

    }
    
  }


})();

// describe('Login Controller', function(){

//   beforeEach(module('MedicionAguaAdmin'));

//   beforeEach(inject(function($controller, $state){
//     this.loginController = $controller('LoginController');
//     this.state = $state;
//   }));

//   it('1. LoginController deberia estar definido', function() {
//     expect(this.loginController).toBeDefined();
//   });

//   it('2. Debería redirigir al estado "measures.home" cuando se ejecuta la función LoginGo', function(){
    
//     var userCredentials = {
//       email: 'prueba@mastertool.cl',
//       password: '12345'
//     };
//     this.redirect = spyOn(this.state, 'go');
    
//     this.loginController.loginGo(userCredentials);
    
//     expect(this.redirect).toHaveBeenCalledWith('measures.home');
//   });

// });