describe('Users Controller', function(){

  beforeEach(module('CommonMocks'));

  beforeEach(module('MedicionAguaAdmin', function($provide, COMMON_MOCKS){
    $provide.value('UsersResolve', COMMON_MOCKS.USERS);
  }));

  beforeEach(inject(function($controller, $state, UsersResolve){
    this.usersController = $controller('UsersController');
    this.state = $state;
    this.UsersResolve = UsersResolve;
  }));

  it('1. UsersController deberia estar definido', function() {
    expect(this.usersController).toBeDefined();
  });

 
});