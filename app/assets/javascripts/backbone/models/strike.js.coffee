class ThreeStrikes.Models.Strike extends Backbone.RelationalModel

  schema: {
    when: {
      type: 'Date'
      validators: ['required']
    }
    reason: {
      type: 'TextArea'
      validators: ['required']
      editorAttrs: { autofocus: 'autofocus' }
    }
    person_id: { type: 'Hidden' }
  }
