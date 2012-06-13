class ThreeStrikes.Views.PeopleShow extends Backbone.View
  template: JST['people/show']

  events: {
    'click .strike': 'strike'
  }

  initialize: ->
    @model.strikes.on('add', @render)

  render: =>
    $(@el).html(@template(@model.toJSON()))
    this

  strike: (event) =>
    event.preventDefault()
    view = new ThreeStrikes.Views.StrikeNew(model: @model)
    view.render()
    $modal = $("#modal")
    $modal.html(view.el)
    $modal.modal()
