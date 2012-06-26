class ThreeStrikes.Models.Person extends Backbone.RelationalModel
  relations: [{
    type: Backbone.HasMany
    key: 'strikes'
    relatedModel: 'ThreeStrikes.Models.Strike'
    collectionType: 'ThreeStrikes.Collections.Strikes'
    includeInJSON: false
  }]
  
  schema: {
    name: {
      type: 'Text'
      validators: ['required']
      editorAttrs: { autofocus: 'autofocus' }
    }
  }

  strikes_count: =>
    @get('strikes').length
