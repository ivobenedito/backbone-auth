window.EventBus = _.clone(Backbone.Events)

window.BackboneAuth =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  
  initialize: (options) ->
    @session = new BackboneAuth.Models.Session()
    new BackboneAuth.Routers.HomeRouter()

    Backbone.history.start()