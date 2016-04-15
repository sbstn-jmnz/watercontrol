(function() {
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .service('UsersService', service);
  
  service.$inject = ['$q','$http','APP_SETTINGS', '$resource'];
  
  /* @ngInject */
  function service($q, $http, APP_SETTINGS, $resource) {
    
    var self = this;

    self.usersResource = $resource(APP_SETTINGS.BASE_URL + '/users/:id', {id: '@id'});


    self.getUsers = getUsers;
    self.createUser = createUser;

    //Service implementations
    function resolveUser(response){
      return response.toJSON();
    }

    function getUsers() {
      return self.usersResource.query().$promise;
    }

    function createUser(_user){
      var user = new self.usersResource(_user);
      return user.$save().then(resolveUser);
    }
  }
})();