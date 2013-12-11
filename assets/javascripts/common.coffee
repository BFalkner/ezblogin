requirejs.config
  #urlArgs: "b=" + ((new Date()).getTime())
  shim:
    ember:
      deps: ["jquery"]
      exports: "Ember"
    "ember-data":
      deps: ["ember"]
      exports: "DS"
    showdown:
      exports: "Showdown"
    "ember-auth":
      deps: ["ember"]
    'vendor/ember-auth-request-jquery/ember-auth-request-jquery':
      deps: ["ember-auth"]
    'vendor/ember-auth-response-json/ember-auth-response-json':
      deps: ["ember-auth"]
    'vendor/ember-auth-strategy-token/ember-auth-strategy-token':
      deps: ["ember-auth"]
    'vendor/ember-auth-session-cookie/ember-auth-session-cookie':
      deps: ["ember-auth"]
    'vendor/ember-auth-module-ember-data/ember-auth-module-ember-data':
      deps: ["ember-auth"]
    'vendor/ember-auth-module-rememberable/ember-auth-module-rememberable':
      deps: ["ember-auth"]
    bootstrap:
      deps: ['jquery']
  paths:
    App: "app/app"
    models: "app/models"
    views: "app/views"
    controllers: "app/controllers"
    routes: "app/routes"
    components: "app/components"

    #libs
    jquery: "vendor/jquery/jquery"
    ember: "vendor/ember/ember"
    "ember-data": "vendor/ember-data-shim/ember-data"
    showdown: "vendor/showdown/showdown"
    "ember-auth": "vendor/ember-auth/ember-auth"
    bootstrap: "vendor/bootstrap/bootstrap"
