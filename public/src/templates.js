angular.module('MedicionAguaAdmin').run(['$templateCache', function($templateCache) {
  'use strict';

  $templateCache.put('assets/views/home/home.html',
    '<div ncy-breadcrumb="ncy-breadcrumb"></div>\n' +
    '<div class="container well">\n' +
    '  <h3>Bienvenid@ Admin</h3>\n' +
    '  <div class="row">\n' +
    '    <div class="col-xs-6"> </div>\n' +
    '    <div class="col-xs-6">\n' +
    '      <div class="panel panel-default">\n' +
    '        <div class="panel-heading"><b>Estadística general</b></div>\n' +
    '        <div class="panel-body"><span>Estado de mediciones:</span>\n' +
    '          <div class="progress">\n' +
    '            <div role="progressbar" aria-valuenow="76" aria-valuemin="0" aria-valuemax="100" style="width: 76%" class="progress-bar">76%</div>\n' +
    '          </div>\n' +
    '          <hr><span>Aumento en consumo:</span>\n' +
    '          <div class="progress">\n' +
    '            <div role="progressbar" aria-valuenow="16" aria-valuemin="0" aria-valuemax="100" style="width: 16%" class="progress-bar">16%</div>\n' +
    '          </div>\n' +
    '        </div>\n' +
    '      </div>\n' +
    '    </div>\n' +
    '  </div>\n' +
    '</div>'
  );


  $templateCache.put('assets/views/login/login.html',
    '<div class="container login-container">\n' +
    '  <div class="row">\n' +
    '    <div class="col-xs-12 col-sm-12 col-md-7 col-lg-8 hidden-xs hidden-sm"><img src="assets/images/logo_menuprincipal.png" alt="" width="400"></div>\n' +
    '    <div class="col-xs-12 col-sm-12 col-md-5 col-lg-4">\n' +
    '      <div class="panel panel-default">\n' +
    '        <div style="font-size:16px" class="panel-heading">Login</div>\n' +
    '        <div class="panel-body">\n' +
    '          <form name="loginForm" class="form-signin"><span id="reauth-email" class="reauth-email"></span>\n' +
    '            <input id="inputEmail" type="email" placeholder="Email" ng-model="login.user.email" required="required" class="form-control">\n' +
    '            <input id="inputPassword" type="password" placeholder="Password" ng-model="login.user.password" required="required" class="form-control">\n' +
    '            <div id="remember" class="checkbox">\n' +
    '              <label>Recuerdame\n' +
    '                <input type="checkbox">\n' +
    '              </label>\n' +
    '            </div>\n' +
    '            <div class="center-block forgot-password"><a>¿Olvidó su Password?</a></div>\n' +
    '          </form>\n' +
    '        </div>\n' +
    '        <div class="panel-footer text-right">\n' +
    '          <button type="submit" ng-disabled="loginForm.$invalid" ng-click="login.loginGo(login.user)" class="btn btn-lg btn-primary btn-block btn-signin">Ingresar</button>\n' +
    '        </div>\n' +
    '      </div>\n' +
    '    </div>\n' +
    '  </div>\n' +
    '</div>'
  );


  $templateCache.put('assets/views/main/main.html',
    '<div ui-view="navbar" class="app-navbar"></div>\n' +
    '<div ui-view="main" class="app-section"></div>\n' +
    '<div ng-class="{\'opened\': main.spinnerOpened}" class="main-spinner"><span us-spinner="us-spinner" spinner-theme="mainSpinner"></span>\n' +
    '  <h1>Cargando Información</h1>\n' +
    '</div>'
  );


  $templateCache.put('assets/views/maintenance/assignsector.html',
    '<div ncy-breadcrumb=""></div>\n' +
    '<div class="container">\n' +
    '  <div class="panel panel-success">\n' +
    '    <div class="panel-heading">Asignar sector</div>\n' +
    '    <div class="panel-body">\n' +
    '      <form>\n' +
    '        <div class="form-group">\n' +
    '          <label>Seleccione Sector</label>\n' +
    '          <select class="form-control"></select>\n' +
    '        </div>\n' +
    '        <div class="form-group">\n' +
    '          <label>Seleccion Lector</label>\n' +
    '          <select ng-options="user.id as user.name for user in assignsector.usersList" ng-model="assignsector.selectedUserId" class="form-control"></select>\n' +
    '        </div>\n' +
    '        <div class="form-group text-right">\n' +
    '          <button type="submit" class="btn btn-default">Guardar</button>\n' +
    '        </div>\n' +
    '      </form>\n' +
    '    </div>\n' +
    '  </div>\n' +
    '</div>'
  );


  $templateCache.put('assets/views/maintenance/changechargeparameters.html',
    '<div ncy-breadcrumb=""></div>\n' +
    '<div class="container">\n' +
    '  <div class="panel panel-success">\n' +
    '    <div class="panel-heading">Cambiar parámetros de cobro</div>\n' +
    '    <div class="panel-body">\n' +
    '      <form name="changechargeparametersForm">\n' +
    '        <div class="form-group">\n' +
    '          <label>Cargo fijo:</label>\n' +
    '          <input type="number" ng-model="changeparameters.newParams.fixed" class="form-control">\n' +
    '        </div>\n' +
    '        <div class="form-group">\n' +
    '          <label>Valor m3:</label>\n' +
    '          <input type="number" ng-model="changeparameters.newParams.normal_price" class="form-control">\n' +
    '        </div>\n' +
    '        <div class="form-group">\n' +
    '          <label>Valor sobreconsumo:</label>\n' +
    '          <input type="number" ng-model="changeparameters.newParams.over_consumption_price" class="form-control">\n' +
    '        </div>\n' +
    '        <div class="form-group text-right">\n' +
    '          <button ng-click="changeparameters.saveChanges(changeparameters.newParams)" class="btn btn-default">Guardar</button>\n' +
    '        </div>\n' +
    '      </form>\n' +
    '    </div>\n' +
    '  </div>\n' +
    '</div>'
  );


  $templateCache.put('assets/views/maintenance/changepassword.html',
    '<div ncy-breadcrumb=""></div>\n' +
    '<div class="container">\n' +
    '  <div class="panel panel-success">\n' +
    '    <div class="panel-heading">Cambiar contraseña</div>\n' +
    '    <div class="panel-body">\n' +
    '      <form>\n' +
    '        <div class="form-group">\n' +
    '          <label>Ingrese contraseña actual</label>\n' +
    '          <input type="password" class="form-control">\n' +
    '        </div>\n' +
    '        <div class="form-group">\n' +
    '          <label>Ingrese nueva contraseña</label>\n' +
    '          <input type="password" class="form-control">\n' +
    '        </div>\n' +
    '        <div class="form-group">\n' +
    '          <label>Repita nueva contraseña</label>\n' +
    '          <input type="password" class="form-control">\n' +
    '        </div>\n' +
    '        <div class="form-group text-right">\n' +
    '          <button type="submit" class="btn btn-default">Aceptar</button>\n' +
    '        </div>\n' +
    '      </form>\n' +
    '    </div>\n' +
    '  </div>\n' +
    '</div>'
  );


  $templateCache.put('assets/views/maintenance/confmeasures.html',
    '<div class="row">\n' +
    '  <div ncy-breadcrumb="ncy-breadcrumb"></div>\n' +
    '  <div class="condos-container col-sm-4 col-lg-4">\n' +
    '    <div class="panel panel-success">\n' +
    '      <div class="panel-heading">Proceso de medición Actual</div>\n' +
    '      <div class="panel-body">\n' +
    '        <div class="col-xs-12">\n' +
    '          <button ng-if="measureProcesses.closed" ng-click="measureProcesses.initProcess()" class="btn btn-default">Iniciar Proceso</button>\n' +
    '          <button ng-if="!measureProcesses.closed" ng-click="measureProcesses.closeProcess()" class="btn btn-default">Cerrar Proceso</button>\n' +
    '        </div>\n' +
    '        <div class="parameters-container col-xs-12">\n' +
    '          <label>Parámetros Actuales</label><br>\n' +
    '          <div class="row">\n' +
    '            <div class="col-xs-6">\n' +
    '              <label>Cargo Fijo </label>\n' +
    '            </div>\n' +
    '            <div class="col-xs-6">\n' +
    '              <label>300</label>\n' +
    '            </div>\n' +
    '          </div>\n' +
    '          <div class="row">\n' +
    '            <div class="col-xs-6">\n' +
    '              <label>Valor m3</label>\n' +
    '            </div>\n' +
    '            <div class="col-xs-6">\n' +
    '              <label>293</label>\n' +
    '            </div>\n' +
    '          </div>\n' +
    '          <div class="row">\n' +
    '            <div class="col-xs-6">\n' +
    '              <label>Sobreconsumo</label>\n' +
    '            </div>\n' +
    '            <div class="col-xs-6">\n' +
    '              <label>100</label>\n' +
    '            </div>\n' +
    '          </div>\n' +
    '          <div class="row">\n' +
    '            <div class="col-xs-6">\n' +
    '              <label>Iniciado</label>\n' +
    '            </div>\n' +
    '            <div class="col-xs-6">\n' +
    '              <label>---</label>\n' +
    '            </div>\n' +
    '          </div>\n' +
    '          <div class="row">\n' +
    '            <div class="col-xs-6">\n' +
    '              <label>Cerrado</label>\n' +
    '            </div>\n' +
    '            <div class="col-xs-6">\n' +
    '              <label>---</label>\n' +
    '            </div>\n' +
    '          </div>\n' +
    '        </div>\n' +
    '      </div>\n' +
    '    </div>\n' +
    '  </div>\n' +
    '  <div class="plots-list col-sm-8 col-lg-6">\n' +
    '    <table class="table table-hover table-striped">\n' +
    '      <thead>\n' +
    '        <tr>\n' +
    '          <th class="col-xs-3">Cargo Fijo</th>\n' +
    '          <th class="col-xs-2">Valor m3</th>\n' +
    '          <th class="col-xs-3">Sobreconsumo</th>\n' +
    '          <th class="col-xs-4">Estado</th>\n' +
    '        </tr>\n' +
    '      </thead>\n' +
    '      <tbody>\n' +
    '        \n' +
    '        \n' +
    '        \n' +
    '        \n' +
    '      </tbody>\n' +
    '    </table>\n' +
    '  </div>\n' +
    '</div>\n' +
    '\n'
  );


  $templateCache.put('assets/views/maintenance/maintenance.html',
    '<div ncy-breadcrumb=""></div>\n' +
    '<div class="row maintenance-container">\n' +
    '  <div class="col-sm-12 col-lg-8 col-lg-offset-2">\n' +
    '    <div class="condos-container col-sm-4 col-lg-4">\n' +
    '      <div class="form-group">\n' +
    '        <label>Seleccione Condominio</label>\n' +
    '        <select ng-options="condo.id as condo.name for condo in maintenance.condosList" ng-model="maintenance.selectedCondo" class="form-control"></select>\n' +
    '      </div>\n' +
    '    </div>\n' +
    '    <div class="condos-container col-sm-4 col-lg-4">\n' +
    '      <div class="form-group">\n' +
    '        <label>Periodo</label>\n' +
    '        <select class="form-control"></select>\n' +
    '      </div>\n' +
    '    </div>\n' +
    '  </div>\n' +
    '  <div class="col-sm-12 col-lg-8 col-lg-offset-2">\n' +
    '    <form class="condos-container col-sm-4 col-lg-4">\n' +
    '      <h3>Configuración</h3>\n' +
    '      <div class="form-group">\n' +
    '        <label>Valor sobreconsumo</label>\n' +
    '        <input type="text" class="form-control">\n' +
    '      </div>\n' +
    '      <div class="form-group">\n' +
    '        <label>Cargo fijo</label>\n' +
    '        <input type="text" class="form-control">\n' +
    '      </div>\n' +
    '      <div class="form-group">\n' +
    '        <button type="submit" class="btn btn-primary">Guardar</button>\n' +
    '      </div>\n' +
    '    </form>\n' +
    '  </div>\n' +
    '</div>'
  );


  $templateCache.put('assets/views/maintenance/measureProcesses.html',
    '<div class="row">\n' +
    '  <div ncy-breadcrumb="ncy-breadcrumb"></div>\n' +
    '  <div class="condos-container col-sm-4 col-lg-4">\n' +
    '    <div class="panel panel-success">\n' +
    '      <div class="panel-heading">Proceso de medición Actual</div>\n' +
    '      <div class="panel-body">\n' +
    '        <div class="col-xs-12">\n' +
    '          <button ng-if="measureProcesses.closed" ng-click="measureProcesses.initProcess()" class="btn btn-default">Iniciar Proceso</button>\n' +
    '          <button ng-if="!measureProcesses.closed" ng-click="measureProcesses.closeProcess()" class="btn btn-default">Cerrar Proceso</button>\n' +
    '        </div>\n' +
    '        <div class="parameters-container col-xs-12">\n' +
    '          <h4>Parámetros Actuales</h4><br>\n' +
    '          <div class="row">\n' +
    '            <div class="col-xs-7">\n' +
    '              <label>Cargo Fijo:</label>\n' +
    '            </div>\n' +
    '            <div class="col-xs-5">\n' +
    '              <label ng-bind="measureProcesses.chargeparameters.fixed"></label>\n' +
    '            </div>\n' +
    '          </div>\n' +
    '          <div class="row">\n' +
    '            <div class="col-xs-7">\n' +
    '              <label>Valor m3:</label>\n' +
    '            </div>\n' +
    '            <div class="col-xs-5">\n' +
    '              <label>{{measureProcesses.chargeparameters.normal_price}}</label>\n' +
    '            </div>\n' +
    '          </div>\n' +
    '          <div class="row">\n' +
    '            <div class="col-xs-7">\n' +
    '              <label>Sobreconsumo:</label>\n' +
    '            </div>\n' +
    '            <div class="col-xs-5">\n' +
    '              <label>{{measureProcesses.chargeparameters.over_consumption_price}}</label>\n' +
    '            </div>\n' +
    '          </div>\n' +
    '          <div class="row">\n' +
    '            <div class="col-xs-7">\n' +
    '              <label>Iniciado:</label>\n' +
    '            </div>\n' +
    '            <div class="col-xs-5">\n' +
    '              <label>---</label>\n' +
    '            </div>\n' +
    '          </div>\n' +
    '          <div class="row">\n' +
    '            <div class="col-xs-7">\n' +
    '              <label>Cerrado:</label>\n' +
    '            </div>\n' +
    '            <div class="col-xs-5">\n' +
    '              <label>---</label>\n' +
    '            </div>\n' +
    '          </div><a ui-sref="measures.changechargeparameters" class="btn btn-xs btn-primary"><i class="fa fa-cogs"></i>  Cambiar Parámetros</a>\n' +
    '        </div>\n' +
    '      </div>\n' +
    '    </div>\n' +
    '  </div>\n' +
    '  <div class="plots-list col-sm-8 col-lg-6">\n' +
    '    <table class="table table-hover table-striped">\n' +
    '      <thead>\n' +
    '        <tr>\n' +
    '          <th class="col-xs-3">Cargo Fijo</th>\n' +
    '          <th class="col-xs-2">Valor m3</th>\n' +
    '          <th class="col-xs-3">Sobreconsumo</th>\n' +
    '          <th class="col-xs-4">Estado</th>\n' +
    '        </tr>\n' +
    '      </thead>\n' +
    '      <tbody>\n' +
    '        <tr ng-repeat="process in measureProcesses.measureProcesses track by process.id">\n' +
    '          <td ng-bind="process.fixed"></td>\n' +
    '          <td ng-bind="process.normal_price"></td>\n' +
    '          <td ng-bind="process.over_consumption_price"></td>\n' +
    '          <td ng-bind="process.status"></td>\n' +
    '        </tr>\n' +
    '      </tbody>\n' +
    '    </table>\n' +
    '  </div>\n' +
    '</div>\n' +
    '\n'
  );


  $templateCache.put('assets/views/meters/meters.html',
    '<div ncy-breadcrumb=""></div>\n' +
    '<div class="container">\n' +
    '  <div class="panel panel-success">\n' +
    '    <div class="panel-heading">Medidores</div>\n' +
    '    <div class="panel-body">\n' +
    '      <div class="row">\n' +
    '        <div class="col-xs-4">\n' +
    '          <div class="input-group"><span class="input-group-btn">\n' +
    '              <button type="submit" class="btn btn-default"><i class="fa fa-fw fa-search"></i></button></span>\n' +
    '            <input placeholder="Buscar..." type="text" class="form-control">\n' +
    '          </div>\n' +
    '        </div>\n' +
    '      </div>\n' +
    '      <div class="row">\n' +
    '        <div class="col-xs-6 col-xs-offset-6">\n' +
    '          <div class="btn-group btn-group-justified">\n' +
    '            <div role="group" class="btn-group">\n' +
    '              <button type="button" class="btn btn-default">Copiar</button>\n' +
    '            </div>\n' +
    '            <div role="group" class="btn-group">\n' +
    '              <button type="button" class="btn btn-default">Excel</button>\n' +
    '            </div>\n' +
    '            <div role="group" class="btn-group">\n' +
    '              <button type="button" class="btn btn-default">PDF</button>\n' +
    '            </div>\n' +
    '            <div role="group" class="btn-group">\n' +
    '              <button type="button" class="btn btn-default">Imprimir</button>\n' +
    '            </div>\n' +
    '          </div>\n' +
    '        </div>\n' +
    '      </div><br>\n' +
    '      <table class="table table-condensed">\n' +
    '        <thead>\n' +
    '          <tr>\n' +
    '            <th colspan="3" class="text-center">Propiedad</th>\n' +
    '            <th colspan="3" class="text-center">Historial de consumo</th>\n' +
    '            <th colspan="3" class="text-center">Medidor</th>\n' +
    '          </tr>\n' +
    '        </thead>\n' +
    '        <thead>\n' +
    '          <tr>\n' +
    '            <th>N° Sitio</th>\n' +
    '            <th>Ubicación</th>\n' +
    '            <th>Propietario</th>\n' +
    '            <th>Anterior</th>\n' +
    '            <th>Actual</th>\n' +
    '            <th>Consumo total</th>\n' +
    '            <th>N° Medidor</th>\n' +
    '            <th>Estado del medidor</th>\n' +
    '          </tr>\n' +
    '        </thead>\n' +
    '        <tbody>\n' +
    '          <tr ng-repeat="meter in meters.metersList">\n' +
    '            <td ng-bind="meter.nsitio"></td>\n' +
    '            <td ng-bind="meter.ubicacion"></td>\n' +
    '            <td ng-bind="meter.propietario"></td>\n' +
    '            <td ng-bind="meter.anterior"></td>\n' +
    '            <td ng-bind="meter.actual"></td>\n' +
    '            <td ng-bind="meter.consumototal"></td>\n' +
    '            <td ng-bind="meter.nmedidor"></td>\n' +
    '            <td ng-bind="meter.estadomedidor"></td>\n' +
    '          </tr>\n' +
    '        </tbody>\n' +
    '        <tfoot>\n' +
    '          <tr>\n' +
    '            <td colspan="9">\n' +
    '              <nav>\n' +
    '                <ul class="pagination pagination-sm">\n' +
    '                  <li><a href="#" aria-label="Previous"><span aria-hidden="true">Anterior</span></a></li>\n' +
    '                  <li> <a href="">1</a></li>\n' +
    '                  <li><a href="#" aria-label="Next"><span aria-hidden="true">Siguiente</span></a></li>\n' +
    '                </ul>\n' +
    '              </nav>\n' +
    '            </td>\n' +
    '          </tr>\n' +
    '        </tfoot>\n' +
    '      </table>\n' +
    '    </div>\n' +
    '  </div>\n' +
    '</div>'
  );


  $templateCache.put('assets/views/navbar/navbar.html',
    '<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">\n' +
    '  <header>\n' +
    '    <div class="logo"><img src="assets/images/logo.png"></div>\n' +
    '    <div class="title">\n' +
    '      <h4>Sistema Administración Toma de agua</h4>\n' +
    '    </div>\n' +
    '    <div class="condos-select pull-right form-group">\n' +
    '      <label>Condominio Actual</label>\n' +
    '      <select ng-if="navbar.showCondos" ng-model="navbar.selectedCondo" ng-options="condo.name for condo in navbar.userLogged.condos_assigned " ng-change="navbar.changeCondo(navbar.selectedCondo.id)" class="form-control"></select>\n' +
    '      <label ng-if="!navbar.showCondos" ng-bind="navbar.selectedCondo.name" class="form-control"></label>\n' +
    '    </div>\n' +
    '  </header>\n' +
    '  <div class="container-fluid">\n' +
    '    <div class="navbar-header">\n' +
    '      <button type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false" class="navbar-toggle collapsed"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>\n' +
    '    </div>\n' +
    '    <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse">\n' +
    '      <ul class="nav navbar-nav">\n' +
    '        <li ng-class="{active: navbar.checkState(\'measures.home\')}"><a ui-sref="measures.home" title="Home"><i class="fa fa-lg fa-fw fa-home"></i>Home</a></li>\n' +
    '        <li class="menu-item dropdown"><a ui-sref="measures.maintenance" data-toggle="dropdown" class="dropdown-toggle"><i class="fa fa-lg fa-fw fa-cogs"></i>Mantención<b class="caret"></b></a>\n' +
    '          <ul class="dropdown-menu">\n' +
    '            <li class="menu-item dropdown dropdown-submenu"><a href="#" data-toggle="dropdown" class="dropdown-toggle">Configuración</a>\n' +
    '              <ul class="dropdown-menu">\n' +
    '                <li class="menu-item"><a ui-sref="measures.measureProcesses">Mediciones</a></li>\n' +
    '                <li class="menu-item"><a ui-sref="measures.assignsector">Asignar Sector</a></li>\n' +
    '                <li class="menu-item"><a ui-sref="measures.meters">Medidores</a></li>\n' +
    '              </ul>\n' +
    '            </li>\n' +
    '            <li class="menu-item dropdown dropdown-submenu"><a href="#" data-toggle="dropdown" class="dropdown-toggle">Adm. Perfiles</a>\n' +
    '              <ul class="dropdown-menu">\n' +
    '                <li class="menu-item"><a ui-sref="measures.addusers">Crear lectores</a></li>\n' +
    '                <li class="menu-item"><a ui-sref="measures.users">Editar lectores</a></li>\n' +
    '                <li class="menu-item"><a ui-sref="measures.users">Listar lectores</a></li>\n' +
    '              </ul>\n' +
    '            </li>\n' +
    '            <li class="menu-item dropdown"><a ui-sref="measures.changepassword" class="dropdown-toggle">Cambiar contraseña</a></li>\n' +
    '          </ul>\n' +
    '        </li>\n' +
    '        <li ng-class="{active: navbar.checkState(\'measures.sectors\')}"><a ui-sref="measures.sectors"><i class="fa fa-lg fa-fw fa-bar-chart"></i>Parcelas</a></li>\n' +
    '      </ul>\n' +
    '    </div>\n' +
    '  </div>\n' +
    '</nav>'
  );


  $templateCache.put('assets/views/plots/plot.html',
    '<div class="row plot-container">\n' +
    '  <div ncy-breadcrumb="ncy-breadcrumb"></div>\n' +
    '  <div class="col-xs-8 col-xs-offset-2">\n' +
    '    <div class="panel-default">\n' +
    '      <div class="panel-heading"><b>Datos Parcela</b></div>\n' +
    '      <div class="panel-body">\n' +
    '        <div class="form-group">\n' +
    '          <label>Nº Parcela: </label><span ng-bind="plot.plotSelected.plot_number"> </span>\n' +
    '        </div>\n' +
    '        <div class="form-group">\n' +
    '          <label>Nombre Propietario: </label><span ng-bind="plot.plotSelected.owner.name"> </span>\n' +
    '        </div>\n' +
    '        <div class="form-group">\n' +
    '          <label>RUT Propietario: </label><span ng-bind="plot.plotSelected.owner.rut"> </span>\n' +
    '        </div>\n' +
    '      </div>\n' +
    '    </div>\n' +
    '  </div>\n' +
    '  <div class="row">\n' +
    '    <div class="col-xs-8 col-xs-offset-2">\n' +
    '      <h3>Medidores</h3>\n' +
    '    </div>\n' +
    '    <div class="col-xs-8 col-xs-offset-2">\n' +
    '      <div ng-repeat="meter in plot.plotSelected.meters track by meter.id" class="list-group"><a class="list-group-item">\n' +
    '          <h4 class="list-group-item-heading">Medidor {{meter.id}}</h4>\n' +
    '          <p class="list-group-item-text">\n' +
    '            <button ng-click="plot.goPlotMeasures(meter.id)" class="btn btn-default">Ver Historial</button>\n' +
    '          </p></a></div>\n' +
    '    </div>\n' +
    '  </div>\n' +
    '</div>'
  );


  $templateCache.put('assets/views/plots/plotMeasures.html',
    '<div class="row">\n' +
    '  <div ncy-breadcrumb="ncy-breadcrumb"></div>\n' +
    '  <div class="plots-list col-sm-8 col-lg-6">\n' +
    '    <table class="table table-hover table-striped">\n' +
    '      <thead>\n' +
    '        <tr>\n' +
    '          <th class="col-xs-3">Valor Medido</th>\n' +
    '          <th class="col-xs-2">Comentario</th>\n' +
    '          <th class="col-xs-3">Usuario Medicion</th>\n' +
    '          <th class="col-xs-4">Estado</th>\n' +
    '        </tr>\n' +
    '        <tbody>\n' +
    '          <tr ng-repeat="measure in plotMeasures.plotMeasures.measures track by measure.id">\n' +
    '            <td ng-bind="measure.value"></td>\n' +
    '            <td ng-bind="measure.comment"></td>\n' +
    '            <td ng-bind="measure.user"></td>\n' +
    '            <td ng-bind="measure.status"></td>\n' +
    '          </tr>\n' +
    '        </tbody>\n' +
    '      </thead>\n' +
    '    </table>\n' +
    '  </div>\n' +
    '</div>'
  );


  $templateCache.put('assets/views/plots/plots.html',
    '<div class="row plots-container">\n' +
    '  <div class="col-sm-12 col-lg-8 col-lg-offset-2">\n' +
    '    <div class="condos-container col-sm-4 col-lg-4">\n' +
    '      <div class="form-group">\n' +
    '        <label>Seleccione Condominio</label>\n' +
    '        <select ng-options="condo.id as condo.name for condo in plots.condosList" ng-model="plots.selectedCondo" class="form-control"></select>\n' +
    '      </div>\n' +
    '    </div>\n' +
    '    <div class="search-container col-sm-8 col-lg-6">\n' +
    '      <form name="searchPlot" role="search" ng-submit="plots.searchPlot(plots.searchModel)" class="form-inline">\n' +
    '        <div class="input-group col-xs-12 add-on"> \n' +
    '          <input name="inputSearch" ng-model="plots.searchModel" ng-change="plots.searchPlot(plots.searchModel)" class="form-control">\n' +
    '          <div class="input-group-btn">\n' +
    '            <button type="submit" class="btn btn-default search-button"><i class="fa fa-search"></i></button>\n' +
    '          </div>\n' +
    '        </div>\n' +
    '      </form>\n' +
    '    </div>\n' +
    '  </div>\n' +
    '  <div class="col-sm-12 col-lg-8 col-lg-offset-2">\n' +
    '    <table class="table table-hover table-striped">\n' +
    '      <thead>\n' +
    '        <tr>\n' +
    '          <th class="col-xs-2">Número propiedad</th>\n' +
    '          <th class="col-xs-5">Propietario</th>\n' +
    '          <th class="col-xs-2">Activa</th>\n' +
    '          <th class="col-xs-5">Última Lectura</th>\n' +
    '        </tr>\n' +
    '      </thead>\n' +
    '      <tbody>\n' +
    '        <tr ng-repeat="plot in plots.plotsList track by plot.id">\n' +
    '          <td ng-bind="plot.plotNumber"></td>\n' +
    '          <td ng-bind="plot.owner"></td>\n' +
    '          <td ng-bind="plot.active"></td>\n' +
    '        </tr>\n' +
    '      </tbody>\n' +
    '    </table>\n' +
    '  </div>\n' +
    '</div>'
  );


  $templateCache.put('assets/views/plots/plotsowners.html',
    '<div class="container">\n' +
    '  <div ncy-breadcrumb="ncy-breadcrumb"></div>\n' +
    '  <div class="row">\n' +
    '    <div class="col-sm-6 form-inline">\n' +
    '      <div class="form-group">\n' +
    '        <label style="display:block">Condominio:</label>\n' +
    '        <select ng-options="condo.id as condo.name for condo in plotsowners.condosList" ng-model="plotsowners.selectedCondoId" ng-change="plotsowners.loadSectors(plotsowners.selectedCondoId)" class="form-control"></select>\n' +
    '      </div>\n' +
    '      <div class="form-group">\n' +
    '        <label style="display:block">Sector:</label>\n' +
    '        <select ng-options="sector.id as sector.name for sector in plotsowners.sectorsList" ng-model="plotsowners.selectedSectorId" ng-change="plotsowners.loadPlots(plotsowners.selectedSectorId)" class="form-control"></select>\n' +
    '      </div>\n' +
    '    </div>\n' +
    '    <div class="search-container col-sm-6">\n' +
    '      <form name="searchPlot" role="search" ng-submit="plotsowners.searchPlot(plotsowners.searchModel)" class="form-inline">\n' +
    '        <div class="input-group col-xs-12 add-on"> \n' +
    '          <input name="inputSearch" ng-model="plotsowners.searchModel" ng-change="plotsowners.searchPlot(plotsowners.searchModel)" class="form-control">\n' +
    '          <div class="input-group-btn">\n' +
    '            <button type="submit" class="btn btn-default search-button"><i class="fa fa-search"></i></button>\n' +
    '          </div>\n' +
    '        </div>\n' +
    '      </form>\n' +
    '    </div>\n' +
    '    <div class="row">\n' +
    '      <div class="plots-list col-sm-12">\n' +
    '        <table class="table table-hover table-striped table-condensed">\n' +
    '          <thead>\n' +
    '            <tr>\n' +
    '              <th></th>\n' +
    '              <th colspan="2" class="text-center">Dueño</th>\n' +
    '            </tr>\n' +
    '          </thead>\n' +
    '          <thead>\n' +
    '            <tr>\n' +
    '              <th class="col-xs-2">N° propiedad</th>\n' +
    '              <th class="col-xs-4">Nombre</th>\n' +
    '              <th class="col-xs-4">RUT</th>\n' +
    '              <th class="col-xs-2">Estado</th>\n' +
    '            </tr>\n' +
    '          </thead>\n' +
    '          <tbody>\n' +
    '            <tr ng-repeat="plot in plotsowners.plotsList track by plot.id">\n' +
    '              <td ng-bind="plot.id"></td>\n' +
    '              <td ng-bind="plot.owner"></td>\n' +
    '              <td ng-bind=""></td>\n' +
    '              <td> \n' +
    '                <div class="btn-group"><a ng-click="plotsowners.plotGo(plot.id)" class="btn btn-info btn-xs">Ver</a><a ui-sref="measures.setplotowners({id:plot.id})" ng-if="plot.owner" class="btn btn-primary btn-xs">Cambiar dueño</a><a ui-sref="measures.setplotowners({id:plot.id})" ng-if="!plot.owner" class="btn btn-primary btn-xs">Ingresar dueño</a></div>\n' +
    '              </td>\n' +
    '            </tr>\n' +
    '          </tbody>\n' +
    '        </table>\n' +
    '      </div>\n' +
    '    </div>\n' +
    '  </div>\n' +
    '</div>'
  );


  $templateCache.put('assets/views/plots/setplotowners.html',
    '<div class="container">\n' +
    '  <div ncy-breadcrumb="ncy-breadcrumb"></div>\n' +
    '  <form class="form">\n' +
    '    <div class="form-group">\n' +
    '      <label>Numero</label>\n' +
    '      <input value="{{setplotsowners.plot.plot_number}}" disabled="disabled" class="form-control">\n' +
    '    </div>\n' +
    '    <div class="form-group">\n' +
    '      <label>Dueño</label>\n' +
    '      <ui-select ng-model="setplotsowners.selected.value">\n' +
    '        <ui-select-match><span ng-bind="$select.selected.nombre"></span></ui-select-match>\n' +
    '        <ui-select-choices repeat="item in (setplotsowners.plotsOwners | filter: $select.search) track by item.rut">\n' +
    '          <div ng-bind-html="item.nombre | highlight: $select.search"></div><small>RUT: <span><b ng-bind-html="\'\'+item.rut | highlight: $select.search"></b></span></small>\n' +
    '        </ui-select-choices>\n' +
    '      </ui-select>\n' +
    '    </div>\n' +
    '  </form>\n' +
    '</div>'
  );


  $templateCache.put('assets/views/sectors/sectors.html',
    '<div class="row">\n' +
    '  <div ncy-breadcrumb="ncy-breadcrumb"></div>\n' +
    '  <div class="col-sm-12 col-lg-8 col-lg-offset-2">\n' +
    '    <div class="condos-container col-sm-4 col-lg-4">\n' +
    '      <div class="form-group">\n' +
    '        <label>Seleccione Sector</label>\n' +
    '        <select ng-options="sector.id as sector.name for sector in sectors.sectorsList" ng-model="sectors.selectedSectorId" ng-change="sectors.loadPlots(sectors.selectedSectorId)" class="form-control"></select>\n' +
    '      </div>\n' +
    '    </div>\n' +
    '    <div class="search-container col-sm-8 col-lg-6">\n' +
    '      <form name="searchPlot" role="search" ng-submit="sectors.searchPlot(sectors.searchModel)" class="form-inline">\n' +
    '        <div class="input-group col-xs-12 add-on"> \n' +
    '          <input name="inputSearch" ng-model="sectors.searchModel" ng-change="sectors.searchPlot(sectors.searchModel)" class="form-control">\n' +
    '          <div class="input-group-btn">\n' +
    '            <button type="submit" class="btn btn-default search-button"><i class="fa fa-search"></i></button>\n' +
    '          </div>\n' +
    '        </div>\n' +
    '      </form>\n' +
    '    </div>\n' +
    '    <div class="plots-list col-sm-8 col-lg-6">\n' +
    '      <table class="table table-hover table-striped">\n' +
    '        <thead>\n' +
    '          <tr>\n' +
    '            <th class="col-xs-2">Número propiedad</th>\n' +
    '            <th class="col-xs-4">Valor última medición</th>\n' +
    '            <th class="col-xs-4">Lectura hecha por</th>\n' +
    '            <th class="col-xs-2"></th>\n' +
    '          </tr>\n' +
    '        </thead>\n' +
    '        <tbody>\n' +
    '          <tr ng-repeat="plot in sectors.plotsList track by plot.id">\n' +
    '            <td ng-bind="plot.plot_number"></td>\n' +
    '            <td ng-bind="plot.meters[0].last_measure.value"></td>\n' +
    '            <td ng-bind="plot.meters[0].last_measure.last_measurer"></td>\n' +
    '            <td> <a ng-click="sectors.plotGo(plot.id)" class="btn btn-info">Ver</a></td>\n' +
    '          </tr>\n' +
    '        </tbody>\n' +
    '      </table>\n' +
    '    </div>\n' +
    '  </div>\n' +
    '</div>'
  );


  $templateCache.put('assets/views/users/addedit.html',
    '<div ncy-breadcrumb=""></div>\n' +
    '<div class="container users-container">\n' +
    '  <h3>Agregar usuario</h3>\n' +
    '  <hr>\n' +
    '  <form name="addeditform" ng-submit="addeditusers.addedit(addeditusers.user)" class="form">\n' +
    '    <div class="form-group">\n' +
    '      <label>Nombre:</label>\n' +
    '      <input type="text" name="name" ng-model="addeditusers.user.name" ng-minlength="4" required="required" class="form-control">\n' +
    '    </div>\n' +
    '    <div ng-messages="addeditform.name.$error" ng-if="addeditform.name.$touched" role="alert">\n' +
    '      <div ng-message="required" class="form-validation"><small class="text-warning"><b>Campo requerido</b> </small></div>\n' +
    '      <div ng-message="minlength" class="form-validation"><small class="text-warning"><b>Nombre demasiado corto</b></small></div>\n' +
    '    </div>\n' +
    '    <div class="form-group">\n' +
    '      <label>Rut:</label>\n' +
    '      <input type="text" name="rut" ng-model="addeditusers.user.rut" required="required" ng-model-options="{ updateOn: \'blur\' }" gp-rut-validator="gp-rut-validator" class="form-control">\n' +
    '    </div>\n' +
    '    <div ng-messages="addeditform.rut.$error" ng-if="addeditform.rut.$touched" role="alert">\n' +
    '      <div ng-message="required" class="form-validation"> <small class="text-warning"><b>Campo requerido</b></small></div>\n' +
    '      <div ng-message="rutInvalid" class="form-validation"><small class="text-warning"><b>Rut inválido</b></small></div>\n' +
    '    </div>\n' +
    '    <div class="form-group">\n' +
    '      <button type="submit" ng-disabled="addeditform.$invalid" class="btn btn-default">Guardar</button>\n' +
    '    </div>\n' +
    '  </form>\n' +
    '</div>'
  );


  $templateCache.put('assets/views/users/users.html',
    '<div ncy-breadcrumb=""></div>\n' +
    '<div class="container">\n' +
    '  <div class="panel panel-success">\n' +
    '    <div class="panel-heading">Listar Lector</div>\n' +
    '    <div class="panel-body">\n' +
    '      <div class="row">\n' +
    '        <div class="col-xs-4">\n' +
    '          <div class="input-group"><span class="input-group-btn">\n' +
    '              <button type="submit" class="btn btn-default"><i class="fa fa-fw fa-search"></i></button></span>\n' +
    '            <input placeholder="Buscar..." type="text" class="form-control">\n' +
    '          </div>\n' +
    '        </div>\n' +
    '      </div>\n' +
    '      <div class="row">\n' +
    '        <div class="col-xs-6 col-xs-offset-6">\n' +
    '          <div class="btn-group btn-group-justified">\n' +
    '            <div role="group" class="btn-group">\n' +
    '              <button type="button" class="btn btn-default">Copiar</button>\n' +
    '            </div>\n' +
    '            <div role="group" class="btn-group">\n' +
    '              <button type="button" class="btn btn-default">Excel</button>\n' +
    '            </div>\n' +
    '            <div role="group" class="btn-group">\n' +
    '              <button type="button" class="btn btn-default">PDF</button>\n' +
    '            </div>\n' +
    '            <div role="group" class="btn-group">\n' +
    '              <button type="button" class="btn btn-default">Imprimir</button>\n' +
    '            </div>\n' +
    '          </div>\n' +
    '        </div>\n' +
    '      </div><br>\n' +
    '      <table class="table table-condensed">\n' +
    '        <thead>\n' +
    '          <tr>\n' +
    '            <th>RUN</th>\n' +
    '            <th>Nombres</th>\n' +
    '            <th>Apellido Paterno</th>\n' +
    '            <th>Apellido Materno</th>\n' +
    '            <th>Correo Electronico</th>\n' +
    '            <th>Telefono</th>\n' +
    '            <th>Usuario</th>\n' +
    '            <th>Sector asignado</th>\n' +
    '            <th>Opciones</th>\n' +
    '          </tr>\n' +
    '        </thead>\n' +
    '        <tbody>\n' +
    '          <tr ng-repeat="user in users.usersList">\n' +
    '            <td ng-bind="user.rut"></td>\n' +
    '            <td ng-bind="user.name"></td>\n' +
    '            <td ng-bind=""></td>\n' +
    '            <td ng-bind=""></td>\n' +
    '            <td ng-bind=""></td>\n' +
    '            <td ng-bind=""></td>\n' +
    '            <td ng-bind=""></td>\n' +
    '            <td ng-bind=""></td>\n' +
    '            <td class="users-options">\n' +
    '              <div role="toolbar" class="btn-group btn-group-xs"><a ui-sref="measures.addedit/{{user.user_id}}" class="btn btn-primary"> <i class="glyphicon glyphicon-pencil"></i></a><a ui-sref="measures.editpassword/{{user.user_id}}" class="btn btn-info"><i class="glyphicon glyphicon-cog"></i></a><a ui-sref="measures.deleteuser/{{user.user_id}}" class="btn btn-primary"><i class="glyphicon glyphicon-remove"></i></a></div>\n' +
    '            </td>\n' +
    '          </tr>\n' +
    '        </tbody>\n' +
    '        <tfoot>\n' +
    '          <tr>\n' +
    '            <td colspan="9">\n' +
    '              <nav>\n' +
    '                <ul class="pagination pagination-sm">\n' +
    '                  <li><a href="#" aria-label="Previous"><span aria-hidden="true">Anterior</span></a></li>\n' +
    '                  <li> <a href="">1</a></li>\n' +
    '                  <li><a href="#" aria-label="Next"><span aria-hidden="true">Siguiente</span></a></li>\n' +
    '                </ul>\n' +
    '              </nav>\n' +
    '            </td>\n' +
    '          </tr>\n' +
    '        </tfoot>\n' +
    '      </table>\n' +
    '    </div>\n' +
    '  </div>\n' +
    '</div>'
  );

}]);
