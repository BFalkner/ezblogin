requirejs.config
  #urlArgs: "b=" + ((new Date()).getTime())
  shim:
    handlebars:
      deps: []
      exports: "Handlebars"
    ember:
      deps: ["handlebars", "jquery"]
      exports: "Ember"
    "ember-data":
      deps: ["ember"]
      exports: "DS"
    showdown:
      exports: "Showdown"
  paths:
    App: "app/app"
    models: "app/models"
    views: "app/views"
    controllers: "app/controllers"
    routes: "app/routes"
    
    #libs
    jquery: "vendor/jquery/jquery"
    handlebars: "vendor/handlebars/handlebars"
    ember: "vendor/ember/ember"
    "ember-data": "vendor/ember-data-shim/ember-data"
    showdown: "vendor/showdown/showdown"
    "ember-auth": "vendor/ember-auth/ember-auth"
