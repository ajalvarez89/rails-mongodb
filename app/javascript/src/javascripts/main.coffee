window.PLATZI =
  init: ->
    console.log('Make with love by alvaro')
    return
  tasks:
    index:
      setup: ->
        console.log('In the index page')
        return

$(document).on 'turbolinks:load', ->
  PLATZI.init()