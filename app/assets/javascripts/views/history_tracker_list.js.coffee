class BackboneAuth.Views.HistoryTrackerList extends Backbone.View
  className: 'js-bb-historyTrackerList bb-historyTrackerList'
  template: JST['history_tracker_list']

  initialize: ->
    @listenTo @collection, 'reset', @render, @

  render: ->
    @renderTemplate()
    @renderHistoryTrackers()
    @

  renderTemplate: ->
    @$el.html @template(@collection.toJSON())

  renderHistoryTrackers: ->
    @$('.items').empty()
    @collection.each @renderHistoryTracker, @

  renderHistoryTracker: (historyTracker) ->
    historyTrackerView = new BackboneAuth.Views.HistoryTracker(model: historyTracker)
    @$el.append(historyTrackerView.render().el)

