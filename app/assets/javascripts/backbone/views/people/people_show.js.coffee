class ThreeStrikes.Views.PeopleShow extends Backbone.View
  template: JST['people/show']

  render: ->
    $(@el).html(@template(@model.toJSON()))
    this
