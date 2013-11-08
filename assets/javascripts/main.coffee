require ['common'], ->
  require ['App', 'ember'], (App, Ember) ->
    window.App = Ember.Application.createWithMixins(App)
