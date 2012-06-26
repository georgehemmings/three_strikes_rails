class ThreeStrikes.Models.Strike extends Backbone.RelationalModel

  schema: {
    reason: {
      type: 'TextArea'
      validators: ['required']
      editorAttrs: { autofocus: 'autofocus' }
    }
    person_id: { type: 'Hidden' }
  }
