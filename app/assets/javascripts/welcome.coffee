# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).scroll ->
  if $(window).scrollTop() >= 400
    $('.navbar').css "background-image", "url('/images/wood.png')"
  else
    $('.navbar').css 'background', 'transparent'
  return
return