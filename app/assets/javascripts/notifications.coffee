# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#notification').delay(500).fadeIn 'normal', ->
    $(this).delay(2500).fadeOut()
    return
  return