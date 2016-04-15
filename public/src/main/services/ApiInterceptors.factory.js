(function() {
  'use strict';
  
  angular
    .module('MedicionAguaAdmin')
    .factory('ApiInterceptors', factory);
  
  factory.$inject = ['$q', 'AuthService'];
  
  function factory($q, AuthService) {
    var service = {
      
      request: handleRequest,
      responseError: handleError

    };
    return service;
    
    function handleRequest(request){
      //by pass for the request, always should be return something
      var userToken = AuthService.getUser().token;
      
      request.headers['Authorization'] = 'Token token=' + userToken;
      return request;
    }

    function handleError(rejection) {
      return $q.reject(rejection);
    }
  }

})();