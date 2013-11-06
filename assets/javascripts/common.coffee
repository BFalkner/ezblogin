requirejs.config
  #urlArgs: "b=" + ((new Date()).getTime())
  shim:
    handlebars:
      deps: []
      exports: "Handlebars"
    ember:
      deps: ["handlebars", "jquery"]
      exports: "Ember"
  paths:
    #libs
    jquery: "vendor/jquery/jquery"
    handlebars: "vendor/handlebars/handlebars"
    ember: "vendor/ember/ember"
