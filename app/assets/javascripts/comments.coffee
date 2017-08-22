# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# Count characters on textarea when leaving a comment.

$(document).on 'turbolinks:load', ->
  maxCount = 140
  $('textarea').on 'keydown', ->
    currentValue = maxCount - (@value.length + 1) + " characters remaining"
    countDown = @value.length
    $(this).parent().children('#counter').text currentValue
    if countDown >= maxCount
      $(this).parent().children('#counter').addClass 'counter-negative'
    else if countDown < maxCount
      $(this).parent().children('#counter').removeClass 'counter-negative'
    return
  return

  $('textarea').on 'keyup', ->
    currentValue = maxCount - (@value.length + 1) + " characters remaining"
    countDown = @value.length
    $(this).parent().children('#counter').text currentValue
    return
