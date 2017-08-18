# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

//= require welcome

$(document).on 'turbolinks:load', ->
  console.log 'hey'
  $('#new-post-button').on 'click', (event) ->
    $('.new-post-form').toggle 'show'
    return
return