define [
  'views/application'
  'app/router'
  'ember-data'
  ], (ApplicationView, Router, DS) ->
    App =
        ApplicationView: ApplicationView
        Router: Router
        Store: DS.Store.extend
          revision: 12
