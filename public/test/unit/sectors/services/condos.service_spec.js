describe('Condos Service', function(){

  beforeEach(module('CommonMocks'));
  beforeEach(module('MedicionAguaAdmin'));

  beforeEach(inject(function($rootScope, $state, $httpBackend, CondosService, COMMON_TASKS){
    this.CondosService = CondosService;
    this.httpBackend  = $httpBackend;
    this.scope = $rootScope.$new();
    this.state = $state;
  
    COMMON_TASKS.setAppRequests();

  }));

  it('1. Debería recibir un array con 2 condominios"', function(){
    
    this.CondosService.getCondos().then(function(condos){
      expect(_.isArray(condos)).toBe(true);
      expect(condos.length).toEqual(2);
    });
    this.httpBackend.flush();
  });


  it('2. Debería obtener un condominio con id numérico y con un array de sectores', function(){
    var condoId = 1;
    
    this.CondosService.getCondo(condoId).then(function(condo){
      expect(_.isNumber(condo.id)).toBe(true);
      expect(_.isArray(condo.sectors)).toBe(true);
    });
    this.httpBackend.flush();
  });

});