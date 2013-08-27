class BackboneAuth.Routers.HomeRouter extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    console.debug '# Initialized HomeRouter'

  index: ->
    BackboneAuth.session.load =>
      loginFormView = new BackboneAuth.Views.LoginForm()
      $('body').append(loginFormView.render().el)

    
