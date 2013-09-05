class BackboneAuth.Views.ArticleHistory extends Backbone.View
  className: 'js-bb-articleHistory bb-articleHistory'
  template: JST['article_history']

  render: ->
    @renderTemplate()
    @

  renderTemplate: ->
    @$el.html @template()