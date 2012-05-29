class ThreeStrikes.Models.Person extends Backbone.Model

  initialize: ->
    @on('change:strikes', @parseStrikes)
    @parseStrikes()
    @strikes.on('change', => @.trigger('change'))

  strike: =>
    @strikes.create(
      strike: { person_id: @id }
    )

  parseStrikes: ->
    @strikes = new ThreeStrikes.Collections.Strikes(@get('strikes'))

  strikes_count: =>
    @strikes.length
