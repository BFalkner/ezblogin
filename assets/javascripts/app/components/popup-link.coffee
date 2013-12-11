define (require) ->
  Ember = require 'ember'
  require 'bootstrap'

  Ember.Component.extend
    tagName: 'a'
    value: 'Popup'

    animation: true
    placement: 'right'
    on: 'click'
    title: ''
    showDelay: 0
    hideDelay: 0

    delay: ((key, value) ->
      if value?
        @set 'showDelay', value
        @set 'hideDelay', value

      {
        show: @get 'showDelay'
        hide: @get 'hideDelay'
      }
    ).property('showDelay', 'hideDelay')

    containerElement: false

    didInsertElement: ->
      template    = @get 'template'
      parentView  = @_parentView
      context     = parentView.get 'context'
      controller  = parentView.get 'controller'
      keywords    = parentView.cloneKeywords()
      keywords.popover = @
      contentView = @createChildView Ember.View,
        isVirtual:  true
        template:   template
        context:    context
        controller: controller
        templateData:
          keywords: keywords

      @$().popover
        html: true
        content: contentView
        animation:  @get 'animation'
        placement:  @get 'placement'
        trigger:    @get 'on'
        title:      @get 'title'
        delay:      @get 'delay'
        container:  @get 'containerElement'

      popover = @$().data 'bs.popover'
      popover.setContent = ->
        $tip = @tip()
        title = @getTitle()
        contentView = @getContent()

        $tip.find('.popover-title').text(title)
        $tip.find('.popover-title').hide() unless title

        contentView.createElement()
        contentView.$().appendTo $tip.find('.popover-content').empty()
        contentView.rerender()

        $tip.removeClass 'fade top bottom left right in'

      @$().on 'hide.bs.popover', ->
        popover.tip().one $.support.transition.end, ->
          popover.tip().detach()


    willDestroyElement: ->
      @$().popover 'destroy'

    actions:
      show: ->
        @$().popover 'show'
      hide: ->
        @$().popover 'hide'
      toggle: ->
        @$().popover 'toggle'
