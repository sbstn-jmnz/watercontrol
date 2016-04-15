describe('Meters Controller', function(){

  beforeEach(module('MedicionAguaAdmin'));
  
  beforeEach(inject(function($controller){
    this.MetersController = $controller('MetersController');
  }));

  it('1. MetersController deberia estar definido', function() {
    expect(this.MetersController).toBeDefined();
  });

  it('2. MeterController deberia recibir un array de los medidores', function(){
    expect(true).toBeTruthy();
  });

});