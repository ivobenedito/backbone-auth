class BackboneAuth.Views.ArticleListItem extends Backbone.View
  tagName: 'tr'
  className: 'js-articleListItem articleListItem'
  template: JST['article_list_item']

  render: ->
    @renderTemplate()
    @

  renderTemplate: ->
    @$el.html @template(@model.toJSON())