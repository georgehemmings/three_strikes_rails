class ThreeStrikes.Views.PeopleShow extends Support.CompositeView
  template: JST['people/show']

  events:
    'click .strike': 'strike'

  initialize: ->
    @model.strikes.on('add', @render)
    @model.strikes.on('remove', @rerender)

  render: =>
    $(@el).html(@template(@model.toJSON()))
    @model.strikes.each( (person) =>
      row = new ThreeStrikes.Views.StrikeItem(model: person)
      @renderChild(row)
      @$('tbody').append(
        row.el
      )
    )
    this

  rerender: =>
    @render() if @model.strikes.length == 0

  strike: (event) =>
    event.preventDefault()
    view = new ThreeStrikes.Views.StrikeNew(model: @model)
    view.render()
    $modal = $("#modal")
    $modal.html(view.el)
    $modal.modal()
