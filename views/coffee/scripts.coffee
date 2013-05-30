$(document).ready ->
  $(window).load ->
    $('body').fadeIn 500


  links = $("ul.nav li a")
  links.live "click", (e) ->
    e.preventDefault()
    load = $('#load')
    if $(@).parents("li").hasClass('active')
      return false
    else 
      links.parents("li").removeClass('active')
      $(@).parents("li").addClass('active')
      load.css "visibility", "none"
      $.ajax(@href).done (data) ->
        load.html(data).hide().fadeIn 200

  
  $(document).mousemove (e) ->
    topbar = $('.topbar')
    width = $(window).width()
    top = e.pageY
    x = e.pageX
    if top < 100  
      topbar.css "width", "#{(x / width) * 100}%"

    if top > 100  
      topbar.css "width", "100%"

  $('.info-link').on "click", -> 
    $('.info').slideToggle()


