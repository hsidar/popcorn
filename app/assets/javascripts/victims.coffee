# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  audio = $('#bong')[0]
  $('#popcorn').click ->
    audio.play()
    alert 'Chosen person is poop.'
    return
  $('#popcorn').hover (->
    $('#bg').animate { opacity: 0 }, 'fast', ->
      $(this).css 'background-size', '100% 100%'
      $(this).css 'background-repeat', 'no-repeat'
      $(this).css('background-image', 'image-url("background-red.jpg")').animate opacity: 1
      return
    return
  ), ->
    $('#bg').animate { opacity: 0 }, 'slow', ->
      $(this).css 'background-size', '100% 100%'
      $(this).css 'background-repeat', 'no-repeat'
      $(this).css('background-image', 'image-url("background-red.jpg")').animate opacity: 0
      return
    return
#  $('#hamburger').click ->
#    $('#menu').fadeTo 'fast', 0.2
#    $('#menu').css 'z-index', 5
#    $('#options').fadeTo 'slow', 1
#    return
#  $('#menu').mouseleave ->
#    $('#menu').fadeTo 'slow', 0
#    $('#menu').css 'z-index', 0
#    $('#options').fadeTo 'fast', 0
#    return
return