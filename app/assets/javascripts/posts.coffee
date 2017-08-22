# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Show new post form when button is clicked.

$(document).on 'turbolinks:load', ->
  $('#new-post-button').on 'click', (event) ->
    $('.new-post-form').toggle 'show'
    $('body').scrollTop(0)
    return
return