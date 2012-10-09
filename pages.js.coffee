# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

showSidebar = ->
  $('.sidebar').css('opacity', '1')

closePanels = (button, originalHeight) ->
  $('.sidebar .button').css('top', '0px')
  $('.sidebar .button').removeClass('active')
  heightToMove = $(button).find('.sub-button').size() * 41
  $(button).parent('.sidebar').css('height', originalHeight + heightToMove)
  $(button).nextAll('.sidebar .button').css('top', heightToMove)

$ ->
  # Set up sidebar (workaround for css3 height transitions bug in Chrome)
  originalHeight = $('.sidebar').height()
  $('.sidebar').css('height', originalHeight)
  setTimeout showSidebar, 500
  windowHeight = $(window).height()
  $('.sidebar-background').css('height', windowHeight)

  # Add shadows to the top of the sub-buttons
  $.each($('.sidebar .button'), (i, button) ->
    $(button).find('.sub-button').first().addClass('first')
  )

  $('.sidebar .button').live('click', ->
    closePanels(this, originalHeight)
    $(this).addClass('active')
  )

  $('.sidebar .sub-button').live('click', ->
    $('.sidebar .sub-button').removeClass('active')
    $(this).addClass('active')
  )
