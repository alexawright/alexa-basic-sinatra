# Backbone defines 4 basic classes:

# Model: 
# Models store data and handle loading from / saving to the server. These fire 
# events when their attributes change so that views can listen and update the 
# page.

# Collection:
# These are just collections of models - they handle loading groups of models, 
# sorting them, etc.  They fire events when things get added or removed.

# View:
# These manage the state of one dom element and everything inside it. They 
# usually get passed a model or collection instance when they are created, and 
# are responsible for filling in the content inside their element, updating it 
# in response to changes to their model / collection, and for updating their 
# model or collection in response to user input inside their dom element.

# Router:
# This responds to changes in the urls / updates it when we change pages  

# This is a super simple app - we don't even really need models or collections, 
# but I used them anyways as an example.  The models never change and there 
# isn't much user interaction to respond to, so views will just render content.


# a page showing all the items in the collection
class CollectionPageView extends Backbone.View
  tagName: 'ul'
  className: 'projects'
  
  render: ->
    # we create a view for each item in the collection and add it this view's
    # element
    @collection.each (model) => 
      @$el.append (new CollectionItemView {model}).render().el
    
    # i like to make the view's render method return itself so we can chain 
    this  


# a view for an individual item on the collection page
class CollectionItemView extends Backbone.View
  tagName: 'li'

  # just use underscore's ugly ass template format here
  # we only need 7 lines total, so not worth it to get hamlc working
  template: _.template """
    <a href="<%= url %>"><img src="/images/<%= thumbnail %>"/></a>
    <h4><%= title %></h4>
  """

  render: -> 
    # this view just renders its template, passing data from its model
    @$el.html @template @model.attributes
    this


# a detail page for an individual item
class ItemPageView extends Backbone.View
  className: 'item'
  
  template: _.template """
  <% for (var i in images) { %><img src="/images/<%= images[i] %>"/><% } %>
  <h1><%= title %></h1>
  <div class="dash"></div>
  <h2><%= subtitle %></h2>
  <p><%= description %></p>
  """

  render: -> 
    #again we just render the template
    @$el.html @template @model.attributes
    this


# this handles client side url routing using push state
class Router extends Backbone.Router
  initialize: ->

    # when a user clicks a link to another page on the same domain, we navigate
    # using the router instead of loading a new page
    $('body').delegate 'a', 'click', (e) =>
      if e.currentTarget.host == window.location.host
        e.preventDefault()
        # we use substring(1) here to loose the leading slash
        @navigate e.currentTarget.pathname.substring(1), trigger: true

    # next we create routes for each of our collections and each of its items
    _.each data.collections, (collection) =>
      
      # create a function to add the .active class to the nav li
      updateNav = ->
        $('ul.nav li').removeClass 'active'
        $("ul.nav a[href='/#{collection.attributes.url}']").parent().addClass 'active'

      # add the route for the collection
      @route collection.attributes.url, collection.attributes.title, ->
        view = new CollectionPageView {collection}
        $('#load')
          .empty()
          .append view.render().el
        updateNav()

      # add routes for each of the collection's items
      collection.each (model) =>
        @route model.attributes.url, model.attributes.title, ->
          view = new ItemPageView {model}
          $('#load').empty().append view.render().el
          updateNav()

    # finally, we add a wildcard route to catch other urls, redirect to the 
    # first collection's url
    @route '/*', 'missing', => @navigate data.collections[0].attributes.url


# initialize the app

$(document).ready ->

  # we create a router and start it, telling it to use push state instead of 
  # hash urls and navigate to the current page
  router = new Router()
  Backbone.history.start pushState: true
  router.navigate window.location.pathname.substring(1)

  # fade in the body
  $('body').fadeIn 1000
