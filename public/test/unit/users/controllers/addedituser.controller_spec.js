describe('AddEditUser Controller', function(){

  beforeEach(module('CommonMocks'));

  beforeEach(module('MedicionAguaAdmin', function($provide, COMMON_MOCKS){
    $provide.value('UserResolve', COMMON_MOCKS.USER);
  }));

  beforeEach(inject(function($q, $rootScope, $controller, $state, UserResolve, UsersService, COMMON_TASKS){
    
    this.defer = $q.defer();


    this.state = $state;
    this.UserResolve = UserResolve;
    this.UsersService = UsersService;
    this.scope = $rootScope.$new();
    
    this.addedituserController = $controller('AddEditUsersController');
    
    COMMON_TASKS.setAppRequests();

  }));

  it('1. AddEditUser deberia estar definido', function() {
    expect(this.addedituserController).toBeDefined();
  });

  it('2. AddEditUser deberia redireccionar a la grilla de usuarios cuando se ingrese un usuario nuevo', function(){
    
    spyOn(this.state, 'go');
    spyOn(this.UsersService, 'createUser').and.returnValue(this.defer.promise);
    
    this.addedituserController.addedit({name:"aasdasd", rut:"545454"});
    
    this.defer.resolve();
    this.scope.$apply();

    expect(this.state.go).toHaveBeenCalledWith('measures.users');
    
  });

  

});