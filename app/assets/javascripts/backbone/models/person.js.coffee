class ThreeStrikes.Models.Person extends Backbone.RelationalModel
  relations: [{
    type: Backbone.HasMany
    key: 'strikes'
    relatedModel: 'ThreeStrikes.Models.Strike'
    collectionType: 'ThreeStrikes.Collections.Strikes'
  }]

  strikes_count: =>
    @get('strikes').length
