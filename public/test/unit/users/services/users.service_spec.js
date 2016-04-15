describe('Users Service', function(){

  beforeEach(module('CommonMocks'));
  beforeEach(module('MedicionAguaAdmin'));

  beforeEach(inject(function($httpBackend, UsersService, APP_SETTINGS, COMMON_MOCKS, COMMON_TASKS){
    this.UsersService = UsersService;
    this.baseUrl = APP_SETTINGS.BASE_URL;
    this.httpBackend  = $httpBackend;
    this.userResponse = COMMON_MOCKS.USER;
    
    COMMON_TASKS.setAppRequests();

  }));

  it('1. Debería recibir un array con usuarios', function(){
    
    this.UsersService.getUsers().then(function(users){
      expect(_.isArray(users)).toBe(true);
    });
    this.httpBackend.flush();

  });

  it('2. Deberia recibir un objeto user, con el usuario creado.', function(){
    var userKeys = Object.keys(this.userResponse);

    var _user = {name: "Alejandro", rut:"17173879-2"};

    this.UsersService.createUser(_user).then(function(user){
      
      //console.log(Object.keys(user), typeof user.id);

      expect(Object.keys(user)).toEqual(userKeys);
      expect(_.isNumber(user.id)).toBe(true);
    });
    this.httpBackend.flush();
  });

});