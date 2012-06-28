class ThreeStrikes.Views.PeopleShow extends Support.CompositeView
  template: JST['people/show']

  events:
    'click .strike': 'strike'
    'click .delete': 'delete'
    'click .edit': 'edit'

  initialize: ->
    @bindTo(@model, 'change', @render)
    @bindTo(@model, 'add:strikes', @renderStrike)

  render: =>
    $(@el).html(@template(@model.toJSON()))
    @model.get('strikes').each(@renderStrike)
    this

  renderStrike: (strike) =>
    row = new ThreeStrikes.Views.StrikeItem(model: strike)
    @renderChild(row)
    @$('tbody').append(
      row.el
    )
    this

  strike: (event) =>
    event.preventDefault()
    view = new ThreeStrikes.Views.StrikeNew(model: @model)
    view.render()
    $modal = $("#modal")
    $modal.html(view.el)
    $modal.one('hidden', -> view.leave())
    $modal.modal()    

  edit: (event) =>
    event.preventDefault()
    view = new ThreeStrikes.Views.PeopleEdit(
      collection: @collection,
      model: @model
    )
    view.render()
    $modal = $("#modal")
    $modal.html(view.el)
    $modal.one('hidden', -> view.leave())
    $modal.modal()

  delete: (event) =>
    event.preventDefault()
    @model.destroy({
      wait: true
      success: =>
        window.location.hash = ''
    })

  leave: ->
    @unbindFromAll()
    super
