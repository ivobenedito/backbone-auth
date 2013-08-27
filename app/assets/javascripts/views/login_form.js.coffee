class BackboneAuth.Views.LoginForm extends Backbone.View
  className: 'js-loginForm loginForm'
  template: JST['login_form']

  events:
    'submit form': 'onSubmit'

  initialize: ->
    @listenTo EventBus, 'session:signIn', @onSessionSignIn, @
    @listenTo EventBus, 'session:signOut', @onSessionSignOut, @

  render: ->
    @renderTemplate()
    @

  renderTemplate: ->
    @$el.html @template()
    @$el.hide() if BackboneAuth.session.authenticated()

  serialize: =>
    @attributes = {}
    @$('input, select, textarea').each (pos, element) =>
      $element = $(element)
      @attributes[$element.attr('name')] = $element.val() unless _.isEmpty($element.val())
    @attributes

  onSubmit: (ev) ->
    ev.preventDefault()
    BackboneAuth.session.login(@serialize())

  onSessionSignIn: (session) ->
    @$el.hide()

  onSessionSignOut: (session) ->
    @$el.show()