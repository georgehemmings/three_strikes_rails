class ThreeStrikes.Models.Strike extends Backbone.RelationalModel

  schema: {
    reason: {
      type: 'TextArea'
      validators: ['required']
    }
    person_id: { type: 'Hidden' }
  }
