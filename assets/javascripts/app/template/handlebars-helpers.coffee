define ['ember', 'handlebars', 'showdown'], (Ember, Handlebars, Showdown) ->
  Ember.Handlebars.helper 'format-markdown', (value) ->
    new Handlebars.SafeString new Showdown.converter().makeHtml(value)
