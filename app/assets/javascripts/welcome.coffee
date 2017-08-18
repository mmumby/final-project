# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).scroll ->
  if $(window).scrollTop() >= 50
    $('.navbar').css 'background', 'transparent'
  else
    $('.navbar').css 'background', 'transparent'
  return