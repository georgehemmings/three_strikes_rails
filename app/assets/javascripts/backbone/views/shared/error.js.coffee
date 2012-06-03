class ThreeStrikes.Views.Error extends Backbone.View
  template: JST['shared/error']

  render: ->
    $(@el).html(@template(messages: @model.messages())).show()
    this
