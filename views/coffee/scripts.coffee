$(document).ready ->
  $(window).load ->
    $('body').fadeIn 500


  # $(window).scroll (e) ->
  #   top = $(window).scrollTop()
  #   if top > 422
  #     $('ul.nav').addClass "fixed"
  #   else 
  #     $('ul.nav').removeClass "fixed"


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
  

  topbar = $('.topbar')
  title = $('a.title')
  info = $('.topbar .info')

  topbar.on "click", ->    
    $(@).animate
      height: "100px"
    , 200, ->
      info.fadeIn 200

  
  $(document).mousemove (e) ->
    width = $(window).width()
    top = e.pageY
    x = e.pageX
    if top < 100  
      topbar.css "width", "#{(x / width) * 100}%"

    if top > 100  
      topbar.css "width", "100%"
