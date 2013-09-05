class BackboneAuth.Views.ArticleListItem extends Backbone.View
  tagName: 'tr'
  className: 'js-articleListItem articleListItem'
  template: JST['article_list_item']

  events:
    'click .js-btn-article-edit' : 'onBtnEditClick'
    'click .js-btn-article-save' : 'onBtnSaveClick'
    'click .js-btn-article-delete' : 'onBtnDeleteClick'

  render: ->
    @renderTemplate()
    @

  renderTemplate: ->
    @$el.html @template(@model.toJSON())
    @$('input[type="text"]').hide()
    @$('.js-btn-article-save').hide()

  onBtnEditClick: (ev) ->
    ev.preventDefault()
    @$('input[type="text"]').toggle()
    @$('.field-wrapper').toggle()
    @$('.js-btn-article-save').toggle()

  onBtnSaveClick: (ev) ->
    ev.preventDefault()
    
    @model.set('title', @$('input[name="title"]').val())
    @model.set('body', @$('input[name="body"]').val())

    @model.save
      success: ->
        console.debug 'SAVED!'

  onBtnDeleteClick: (ev) ->
    ev.preventDefault()
    console.debug 'delete'