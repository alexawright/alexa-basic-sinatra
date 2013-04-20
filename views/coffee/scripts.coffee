$(document).ready ->
  
  # fade in window on load
  $(window).load ->
    $('body').fadeIn 500

  # handling of the header links
  links = $("header a")
  links.on "click", (e) ->
    e.preventDefault();
    load = $('#load')
    if $(@).hasClass('active')
      return false
    else 
      links.removeClass('active')
      $(@).addClass('active')
      load.fadeOut 400
      $.ajax(@href).done (data) ->
        load.html(data).hide().fadeIn 200
  
  # change width of black bar on mousemove
  $(document).mousemove (e) ->
    topbar = $('.topbar')
    width = $(window).width()
    top = e.pageY
    x = e.pageX
    if top < 100  
      topbar.css "width", "#{(x / width) * 100}%"
    if top > 100  
      topbar.css "width", "100%"
