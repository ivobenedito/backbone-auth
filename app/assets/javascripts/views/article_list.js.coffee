class BackboneAuth.Views.ArticleList extends Backbone.View
  className: 'js-articleList articleList'
  template: JST['article_list']

  render: ->
    @renderTemplate()
    @renderItems()
    @

  renderTemplate: ->
    @$el.html @template()

  renderItems: ->
    @collection.each @renderItem, @

  renderItem: (article) ->
    itemView = new BackboneAuth.Views.ArticleListItem(model: article)
    @$('table').append(itemView.render().el)
