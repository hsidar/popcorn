$(document).ready ->
  audio = $('#bong')[0]
  $('#popcorn').click ->
    audio.play()
    alert 'Eventually this will lead to things.'
    return
  return