$(document).ready ->
  
  $(window).load ->
    $('body').fadeIn 1000


  links = $("ul.nav li a, ul.projects li a")
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
        load.html(data).hide().fadeIn 1000

 