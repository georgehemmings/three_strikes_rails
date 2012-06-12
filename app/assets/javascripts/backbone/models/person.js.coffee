class ThreeStrikes.Models.Person extends Backbone.Model

  initialize: ->
    @strikes = new ThreeStrikes.Collections.Strikes(@get('strikes'))
    @strikes.on('add', => @.trigger('change'))

  strikes_count: =>
    @strikes.length

  toJSON: =>
    json = _.clone(@attributes)
    json.strikes = @strikes.toJSON()
    json
