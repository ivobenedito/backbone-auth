class BackboneAuth.Views.ArticleCreateForm extends Backbone.View
  className: 'js-bb-articleCreateForm bb-articleCreateForm'
  template: JST['article_create_form']

  events:
    'submit form': 'onSubmit'

  render: ->
    @renderTemplate()
    @

  renderTemplate: ->
    @$el.html @template()

  serialize: ->
    @attributes = {}
    @$('input, select, textarea').each (pos, element) =>
      $element = $(element)
      @attributes[$element.attr('name')] = $element.val() unless _.isEmpty($element.val())
    @attributes

  reset: ->
    @$('form')[0].reset()

  onSubmit: (ev) ->
    ev.preventDefault()
    @collection.create @serialize(),
      success: (model, data) => 
        console.debug 'SUCCESS'
        @reset()
      error: (model, xhr) ->
        console.debug 'ERROR'

