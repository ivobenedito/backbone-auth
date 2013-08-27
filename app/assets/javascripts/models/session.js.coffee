class BackboneAuth.Models.Session extends Backbone.Model
  urlRoot: '/api/session'

  load: (callback) ->
    @fetch
      success: callback

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

  authenticated: ->
    @has('user')