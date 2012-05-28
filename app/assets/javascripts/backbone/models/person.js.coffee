class ThreeStrikes.Models.Person extends Backbone.Model

  strike: =>
    strike = new ThreeStrikes.Models.Strike(
      { person_id: @id }
    )
    strike.save()
    @set('strikes_count', @get('strikes_count') + 1)
