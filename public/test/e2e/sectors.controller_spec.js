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

  describe('Sectors Controller', loginSpecs);

  function loginSpecs(){

    
    it('Debería seleccionar una parcela, presionar "Ver" y redirigir al detalle de la parcela', spec1);

    function spec1(){
      var buttonDetails,
          plotMatchRegex = /\/plots\/\d+/;

      browser.get('http://localhost:9000/#/sectors');

      buttonDetails = element(by.css('.plots-list tbody a.btn:nth-child(2)'));

      buttonDetails.click();

      expect(browser.getLocationAbsUrl()).toMatch(plotMatchRegex);
    }


  }

})();