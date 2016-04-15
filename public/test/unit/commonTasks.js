(function() {
  
  'use strict';

  angular
    .module('CommonMocks')
    .factory('COMMON_TASKS', factory);

  factory.$inject = ['APP_SETTINGS', '$httpBackend','COMMON_MOCKS'];

  function factory(APP_SETTINGS, $httpBackend, COMMON_MOCKS){

    var baseUrlRegex = generateBaseUrlRegex(APP_SETTINGS.BASE_URL),
        paramsRegex = /((\?|\&)\w+\=\w+)*$/;


    return {
      setAppRequests : setAppRequests
    };


    function setAppRequests() {
      //Set all url's that the service sets using $http
      var condosUrlRegex = createApiUrlRegex('/condos'),
          condoUrlRegex = createApiUrlRegex('/condos', true),
          measureProcessesRegex = createApiUrlRegex('/condos', true, '/measure_processes'),
          plotUrlRegex = createApiUrlRegex('/plots',true),
          usersUrlRegex = createApiUrlRegex('/users');

      //GET requests
      $httpBackend.whenGET(condosUrlRegex).respond(COMMON_MOCKS.CONDOS);
      $httpBackend.whenGET(condoUrlRegex).respond(COMMON_MOCKS.CONDO);

      $httpBackend.whenGET(plotUrlRegex).respond(COMMON_MOCKS.PLOT);
      $httpBackend.whenGET(usersUrlRegex).respond(COMMON_MOCKS.USERS);
      
      $httpBackend.whenGET(measureProcessesRegex).respond(COMMON_MOCKS.MEASURE_PROCESSES);

      //POST requests
      $httpBackend.whenPOST(usersUrlRegex).respond(COMMON_MOCKS.USER);
      $httpBackend.whenPOST(measureProcessesRegex).respond({message: 'OK'});
    }

    function generateBaseUrlRegex(url){
      
      url = url.replace(/[\/\:\.\-]/g, function(c){
        return c === '/'? '\\\/': '\\' + c;
      });

      return (new RegExp(url));
    }

    function createApiUrlRegex(url, id, nested){
      url = url.replace('/', '\\\/');
      
      if(id)
        url += '\/\\d+';
      if(nested)
        url += nested.replace('/', '\\\/');
      return (new RegExp(baseUrlRegex.source + url + paramsRegex.source));
    }


  }

})();