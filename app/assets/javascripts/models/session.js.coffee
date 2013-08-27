class BackboneAuth.Models.Session extends Backbone.Model
  urlRoot: '/api/session'

  initialize: ->
    @on 'change:user', @onUserChange

  load: (callback) ->
    @fetch
      success: callback

  authenticated: ->
    @has('user')

  login: (credentials) ->
    $.ajax
      url: "#{@urlRoot}"
      type: 'POST'
      data: credentials
      success: (data) =>
        @set(id: data.id)
        @set(user: new BackboneAuth.Models.User(data.user))

  logout: ->
    $.ajax
      url: "#{@urlRoot}"
      type: 'DELETE'
      success: (data) =>
        @unset('user')

  onUserChange: ->
    if @authenticated()
      console.debug 'Authenticated!'
    else
      console.debug 'Not authenticated!'