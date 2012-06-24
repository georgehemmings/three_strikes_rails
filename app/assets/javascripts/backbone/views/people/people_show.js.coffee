class ThreeStrikes.Views.PeopleShow extends Support.CompositeView
  template: JST['people/show']

  events:
    'click .strike': 'strike'

  initialize: ->
    @bindTo(@model, 'add:strikes', @render)
    @bindTo(@model, 'remove:strikes', @rerender)

  render: =>
    $(@el).html(@template(@model.toJSON()))
    @model.get('strikes').each( (strike) =>
      row = new ThreeStrikes.Views.StrikeItem(model: strike)
      @renderChild(row)
      @$('tbody').append(
        row.el
      )
    )
    this

  rerender: =>
    @render() if @model.get('strikes').length == 0

  strike: (event) =>
    event.preventDefault()
    view = new ThreeStrikes.Views.StrikeNew(model: @model)
    view.render()
    $modal = $("#modal")
    $modal.html(view.el)
    $modal.one('hidden', -> view.leave())
    $modal.modal()

  leave: ->
    @unbindFromAll()
    super
