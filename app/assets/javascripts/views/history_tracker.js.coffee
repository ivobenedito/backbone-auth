class BackboneAuth.Views.HistoryTracker extends Backbone.View
  className: 'js-bb-historyTracker bb-historyTracker'
  template: JST['history_tracker']

  render: ->
    @renderTemplate()
    @

  renderTemplate: ->
    @$el.html @template(@model.toJSON())