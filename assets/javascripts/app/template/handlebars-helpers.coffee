define ['ember', 'showdown'], (Ember, Showdown) ->
  Ember.Handlebars.helper 'format-markdown', (value) ->
    new Handlebars.SafeString new Showdown.converter().makeHtml(value)
