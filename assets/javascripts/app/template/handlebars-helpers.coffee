define ['handlebars', 'showdown'], (Handlebars, Showdown) ->
  Handlebars.registerHelper 'format-markdown', (value) ->
    new Handlebars.SafeString new Showdown.converter().makeHtml(@content.get value)
