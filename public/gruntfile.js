module.exports = function(grunt) {
  require('es6-promise').polyfill();

  //Variables que representan aspectos de la estructura de la aplicación
  var ANGULAR_MAIN_MODULE  = 'MedicionAguaAdmin',
      
      ANGULAR_TEMPLATES    = ['assets/views/**/*.html'],
      TEMPLATE_CACHE_DEST  = 'src/templates.js',
      
      WIREDEP_APP_DEST     = 'index.html',
      WIREDEP_TEST_DEST    = 'karma.conf.js',
      JAVASCRIPT_ARRAY_SRC = ['src/**/*.js'],

      INDEX_URL            = 'http://localhost:9000/#/sectors',

      FILES_FOR_WATCH = {
                          'JS'    : [ 'src/**/*.js', 'components/**/*.js','test/**/*.js', '!src/templates.js'],
                          'CSS'   : [ 'assets/css/**/*.css' ],
                          'SCSS'  : [ 'src/**/*.scss', 'components/**/*.scss'],
                          'JADE'  : [ 'src/**/*.jade', 'components/**/*.jade' ],
                          'INDEX' : [ 'index.html' ],
                          'GRUNT' : [ 'gruntfile.js' ]
                        },
       
      
      INJECTOR_ARRAY_SRC   = ['src/**/*.js', 'assets/css/**/*.css'],

      TASKS_WHEN_FILES_CHANGE = {
                          'JS'    : [ 'injector','shell:test' ],
                          'CSS'   : [ 'postcss','injector' ],
                          'SCSS'  : [ 'compass'],
                          'JADE'  : [ 'jade', 'ngtemplates' ],
                          'INDEX' : [ 'injector'],
                          'GRUNT' : [ 'jade', 'ngtemplates', 'wiredep', 'compass','postcss', 'injector' , 'shell:test' ],
                           },
     
      DEFAULT_TASKS        = [  'jade',
                                'ngtemplates',
                                'wiredep',
                                'compass',
                                'postcss',
                                'injector',
                                'shell:test',
                                'connect:server',
                                'open:dev',
                                'watch' ],

      COVERAGE_TASKS = [  'shell:test',
                          'open:coverage',
                          'connect:coverage' ],

      COVERAGE_URL = 'http://localhost:9000',

      COVERAGE_BASE = process.platform === "linux"? './test/coverage/PhantomJS 2.1.1 (Linux 0.0.0)'
                                                  : './test/coverage/PhantomJS 2.1.1 (Mac OS X 0.0.0)',

      

      E2E_TASKS = [ 'jade',
                    'ngtemplates',
                    'wiredep',
                    'compass',
                    'postcss',
                    'injector',
                    'connect:server',
                    'shell:webdriver',
                    'shell:e2e'],

      DIST_TASKS = ['clean:dist', 'shell:createdist'];


  //Cargar paquetes de grunt
  require('load-grunt-tasks')(grunt);

  grunt.loadNpmTasks('grunt-angular-templates');
  grunt.loadNpmTasks('grunt-wiredep');
  grunt.loadNpmTasks('grunt-injector');
  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-open');
  grunt.loadNpmTasks('grunt-contrib-jade');
  grunt.loadNpmTasks('grunt-contrib-compass');
  grunt.loadNpmTasks('grunt-postcss');
  grunt.loadNpmTasks('grunt-contrib-clean');
  

  //Tareas de grunt
  grunt.registerTask('default', DEFAULT_TASKS);
  grunt.registerTask('e2e', E2E_TASKS);
  grunt.registerTask('coverage', COVERAGE_TASKS);
  grunt.registerTask('dist', DIST_TASKS);


  //Configuracion de tareas
  grunt.initConfig({
    clean: {
      dist: "build/"
    },

    shell: {
      test: {
        command: 'karma start --single-run'
      },

      e2e: {
        command: 'protractor protractor.conf.js'
      },
      webdriver: {
        command: 'webdriver-manager start'
      },

      createdist: {
        command: 'mkdir dist'
      }
    },

    compass:{
      dist: {
        options: {
          sassDir: 'src',
          cssDir: 'assets/css'
        }
      }
    },

    postcss: {
      options: {
          map: true,
          processors: [
              require('autoprefixer')({
                  browsers: ['last 10 versions']
              })
          ]
      },
      dist: {
        src: 'assets/css/**/*.css'
      }
    },

    jade: {
      compile: {
        options: {
          pretty: true,        
        },
        files: grunt.file.expandMapping(['**/*.jade'], 'assets/views/', {
                cwd: 'src',
                ext: '.html',
                rename: function(destBase, destPath) {
                  return destBase + destPath.replace(/views\//, '');
                }})
        
        //     }),
        // files: [ {
        //   cwd: 'src',
        //   src: '**/views/*.jade',
        //   dest:'assets/views',
        //   expand: true,
        //   ext: '.html'
        // },{
        //   cwd: 'components',
        //   src: '**/*.jade',
        //   dest: 'assets/views',
        //   expand: true,
        //   ext: '.html'
        // }]
      }
    },
    wiredep: {
      app: {
        src: WIREDEP_APP_DEST ,
        ignorePath: /^\/.*/
      },
      test: {
        devDependencies: true,
        src: WIREDEP_TEST_DEST,
        ignorePath:  /\.\.\//,
        fileTypes: {
          js: {
            block: /(([\s\t]*)\/\/\s*bower:*(\S*))(\n|\r|.)*?(\/\/\s*endbower)/gi,
            detect: {
              js: /'(.*\.js)'/gi
            },
            replace: {
              js: '\'{{filePath}}\','
            }
          }
        }
      }
    },
    injector: {
      options: {
        addRootSlash: false
      },
      local_dependencies: {
        files: {
          'index.html' : INJECTOR_ARRAY_SRC
        }
      }
    },
    ngtemplates: {
      app: {
        src: ANGULAR_TEMPLATES,
        dest: TEMPLATE_CACHE_DEST,
        options: {
          module: ANGULAR_MAIN_MODULE,
          quotes: 'single',
          htmlmin: {
            collapseBooleanAttributes:      false,
            collapseWhitespace:             false,
            removeAttributeQuotes:          false,
            removeComments:                 true,
            removeEmptyAttributes:          false,
            removeRedundantAttributes:      false,
            removeScriptTypeAttributes:     true,
            removeStyleLinkTypeAttributes:  false
          }
        }
      }
    },

    connect: {
      server: {
        options: {
          port: 9000,
          base: '.',
          open: false
        }
      },
      coverage: {
        options: {
          keepalive: true,
          port: 9001,
          base: COVERAGE_BASE ,
          open: false
        }
      }
    },
    watch: {
      css: {
        files: FILES_FOR_WATCH.CSS,
        options: {livereload:true},
        tasks: TASKS_WHEN_FILES_CHANGE.CSS,
      },
      js: {
        files: FILES_FOR_WATCH.JS,
        options: {livereload:true},
        tasks: TASKS_WHEN_FILES_CHANGE.JS
      },
      jade:{
        files: FILES_FOR_WATCH.JADE,
        options: {livereload: true},
        tasks: TASKS_WHEN_FILES_CHANGE.JADE
      },
      grunt: {
        files: FILES_FOR_WATCH.GRUNT,
        options: {livereload:true},
        tasks: TASKS_WHEN_FILES_CHANGE.GRUNT
      },
      index: {
        files: FILES_FOR_WATCH.INDEX,
        options: {livereload:true},
        tasks: TASKS_WHEN_FILES_CHANGE.INDEX
      },
      scss: {
        files: FILES_FOR_WATCH.SCSS,
        tasks: TASKS_WHEN_FILES_CHANGE.SCSS
      }
    },
    open: {
      dev: {
        url: INDEX_URL,
        app: function() {
          return process.platform === "linux"? 'Chromium' : 'Google Chrome';
        }
      },
      coverage: {
        options: {delay: 1000},
        url: COVERAGE_URL,
        app: function() {
          return process.platform === "linux"? 'Chromium' : 'Google Chrome';
        }
      }
    },
  });
};