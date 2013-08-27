class BackboneAuth.Models.Article extends Backbone.Model
  urlRoot: '/api/articles'
  defaults:
    id: null
    title: ''
    content: ''