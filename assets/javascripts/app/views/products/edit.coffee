define ['ember', 'pagedown-editor'], (Ember) ->

  ProductsEditView = Ember.View.extend

    didInsertElement: ->
      editor = new Markdown.Editor new Markdown.Converter()
      @set 'editor', editor
      editor.run()


    willDestroyElement: ->
      @set 'editor', null
