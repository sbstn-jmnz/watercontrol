(function(){

  'use strict';

  angular
    .module('MedicionAguaAdmin')
    .service('AuthService', Service);

    //Service.$inject = ['AuthService'];
    
    function Service(){

      var self = this,
          user = null;


      self.login = login;
      self.setUser = setUser;
      self.getUser = getUser;
      
      function login(_user){
        //Login and set user with the response
        var userResponse = {
          role: 'superadmin',
          token: '5ba02cad41892ea9aa08a7b399c1c3d3',
          condos_assigned: [{id:1, name: 'Rio Mar'}, {id:2, name: 'Campo Mar'}],
        };
        userResponse.condoSelected = userResponse.condos_assigned[0];
        
        setUser(userResponse);
      }

      function getUser(){
        return user;
      }

      function setUser(_user){
        user = _user;
      }

    }
})();