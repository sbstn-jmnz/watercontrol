(function() {
  'use strict';
  
  describe('Home Controller', homeSpec);

  function homeSpec(){

    //////////////  GLOBALS   ////////////////////////////////
    var HomeController;
    //////////////  BEFORE EACH ////////////////////////////////
    beforeEach(module('MedicionAguaAdmin'));

    beforeEach(inject(eachSpec));

    function eachSpec($controller){
      HomeController = $controller('HomeController');
    }

    //////////////////   SPECS //////////////////////////////////
    it('1. HomeController deberia estar definido', spec1);

    function spec1() {
      expect(HomeController).toBeDefined();
    }
    
  }

})();