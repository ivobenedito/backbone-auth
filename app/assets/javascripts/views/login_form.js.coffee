class BackboneAuth.Views.LoginForm extends Backbone.View
  classname: 'loginForm js-loginForm'
  template: JST['login_form']

  events:
    'submit form': 'onSubmit'

  render: ->
    @renderTemplate()
    @

  renderTemplate: ->
    @$el.html @template()

  serialize: =>
    @attributes = {}
    @$('input, select, textarea').each (pos, element) =>
      $element = $(element)
      @attributes[$element.attr('name')] = $element.val() unless _.isEmpty($element.val())
    @attributes

  onSubmit: (ev) ->
    ev.preventDefault()
    BackboneAuth.session.login(@serialize())
    false
