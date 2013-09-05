class BackboneAuth.Routers.HomeRouter extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    console.debug '# Initialized HomeRouter'
    @articles = new BackboneAuth.Collections.Articles()

  index: ->
    BackboneAuth.session.load =>

      @loginFormView = new BackboneAuth.Views.LoginForm()
      $('body').append(@loginFormView.render().el)

      @navBarView = new BackboneAuth.Views.NavBar()
      $('body').append(@navBarView.render().el)

      @articleCreateFormView = new BackboneAuth.Views.ArticleCreateForm(collection: @articles)
      $('body').append(@articleCreateFormView.render().el)      

      @articles.fetch
        success: =>
          @articleListView = new BackboneAuth.Views.ArticleList(collection: @articles)
          $('body').append(@articleListView.render().el)




    
