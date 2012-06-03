class ThreeStrikes.Models.Person extends Backbone.Model

  initialize: ->
    @on('change:strikes', @parseStrikes)
    @parseStrikes()
    @strikes.on('add', => @.trigger('change'))

  parseStrikes: ->
    @strikes = new ThreeStrikes.Collections.Strikes(@get('strikes'))

  strikes_count: =>
    @strikes.length
