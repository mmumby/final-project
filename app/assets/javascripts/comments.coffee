# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


//= require welcome

$(document).on 'turbolinks:load', ->
  maxCount = 140
  $('textarea').on 'keydown', ->
    currentValue = maxCount - (@value.length) + " characters remaining"
    countDown = @value.length
    if countDown >= maxCount
      $(this).parent().children('#counter').addClass 'counter-negative'
      $(this).parent().children('#counter').text currentValue
    else if countDown < maxCount
      $(this).parent().children('#counter').removeClass 'counter-negative'
      $(this).parent().children('#counter').text currentValue
    return
  return