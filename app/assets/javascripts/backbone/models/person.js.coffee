class ThreeStrikes.Models.Person extends Backbone.Model

  strike: =>
    strikes = new ThreeStrikes.Collections.Strikes
    strikes.create({
      strike: { person_id: @id }
    })
