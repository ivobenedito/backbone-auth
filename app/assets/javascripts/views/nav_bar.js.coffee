class BackboneAuth.Views.NavBar extends Backbone.View
  className: 'js-navBar navBar'
  template: JST['nav_bar']

  events:
    'click .js-btn-logout' : 'onBtnLogoutClick'

  initialize: ->
    @listenTo EventBus, 'session:signIn', @onSessionSignIn, @
    @listenTo EventBus, 'session:signOut', @onSessionSignOut, @

  render: ->
    @renderTemplate()
    @

  renderTemplate: ->
    @$el.html @template()
    @$el.hide() unless BackboneAuth.session.authenticated()

  onSessionSignIn: (session) ->
    @$el.show()

  onSessionSignOut: (session) ->
    @$el.hide()

  onBtnLogoutClick: (ev) ->
    ev.preventDefault()
    BackboneAuth.session.logout()