define ['jquery', 'templates'], ($, templates) ->

  class ExampleView

    render: (element) ->
      $(element).append templates.example({name:'Emblem', css:'less'})
      $(element).append templates['another-example']({name:'Emblem'})

  ExampleView