(function(){

  'use strict';

  var origFn = browser.driver.controlFlow().execute;

  browser.driver.controlFlow().execute = function() {
    var args = arguments;

    // queue 100ms wait
    origFn.call(browser.driver.controlFlow(), function() {
      return protractor.promise.delayed(100);
    });

    return origFn.apply(browser.driver.controlFlow(), args);
  };

  describe('Login Controller', loginSpecs);

  function loginSpecs(){

    
    beforeEach(function(){
      element(by.model('login.user.email')).clear();
      element(by.model('login.user.password')).clear();
    });



    it('Debería estar deshabilitado por defecto el botón login', spec1);

    function spec1(){
      var emailInput,
          passwordInput,
          btnLogin;

      emailInput = element(by.model('login.user.email'));
      passwordInput = element(by.model('login.user.password'));
      btnLogin = $('button[type="submit"]');
      
      expect(emailInput.getAttribute('value')).toBe('');
      expect(passwordInput.getAttribute('value')).toBe('');
      expect(btnLogin.getAttribute('disabled')).toBe('true');

    }

    it('Debería poder escribir una direccion de email y validarla', spec2);

    function spec2(){

      var emailInput;

      emailInput = element(by.model('login.user.email'));

      //test1
      expect(emailInput.getAttribute('value')).toBe('');

      //test 2
      emailInput.clear();
      emailInput.sendKeys('a@a.cl');

      //test 2
      emailInput.clear();
      emailInput.sendKeys('tama@a.cl');


      //test 2
      emailInput.clear();
      emailInput.sendKeys('tamaraa@a.cl');


      //test 2
      emailInput.clear();
      emailInput.sendKeys('tamia@a.cl');

       //test 2
      emailInput.clear();
      emailInput.sendKeys('a@a.cl');


      
      expect(emailInput.getAttribute('value')).toBe('a@a.cl');
      
    }

    it('Debería poder hacer login una vez ingresados los datos requeridos y redirigir a la pantalla de sectores', spec3);

    function spec3(){
      var emailInput,
          passwordInput,
          btnLogin;

      emailInput = element(by.model('login.user.email'));
      passwordInput = element(by.model('login.user.password'));
      btnLogin = $('button[type="submit"]');

      emailInput.sendKeys('a@a.cl');
      passwordInput.sendKeys('123qwe');

      btnLogin.click();

      browser.getLocationAbsUrl();

      expect(browser.getLocationAbsUrl()).toContain('/sectors');
    }


  }

})();