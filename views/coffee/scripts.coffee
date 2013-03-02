$(document).ready ->
  $(window).load ->
    $('body').fadeIn 500

  links = $("header a")
  links.live "click", (e) ->
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
        