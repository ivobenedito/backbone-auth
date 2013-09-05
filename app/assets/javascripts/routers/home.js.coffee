class BackboneAuth.Routers.HomeRouter extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    console.debug '# Initialized HomeRouter'
    @articles = new BackboneAuth.Collections.Articles()
    @history_trackers = new BackboneAuth.Collections.HistoryTrackers()

  index: ->
    BackboneAuth.session.load =>

      @loginFormView = new BackboneAuth.Views.LoginForm()
      $('body').append(@loginFormView.render().el)

      @navBarView = new BackboneAuth.Views.NavBar()
      $('body').append(@navBarView.render().el)

      @articleCreateFormView = new BackboneAuth.Views.ArticleCreateForm(collection: @articles)
      $('body').append(@articleCreateFormView.render().el)      

      @history_trackers.fetch { reset: true }
      @historyTrackerList = new BackboneAuth.Views.HistoryTrackerList(collection: @history_trackers)
      $('body').append(@historyTrackerList.render().el)

      @articles.fetch
        success: =>
          @articleListView = new BackboneAuth.Views.ArticleList(collection: @articles)
          $('body').append(@articleListView.render().el)




    
