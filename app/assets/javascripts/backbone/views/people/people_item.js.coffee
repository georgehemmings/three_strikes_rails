class ThreeStrikes.Views.PeopleItem extends Support.CompositeView
  template: JST['people/item']
  tagName: 'tr'

  events:
    'click .strike': 'strike'
    'click .delete': 'delete'
    'click .edit': 'edit'

  initialize: ->
    @bindTo(@model, 'change', @render)
    @bindTo(@model, 'add:strikes', @render)

  render: =>
    $(@el).html(@template(@model))
    this

  strike: (event) =>
    event.preventDefault()
    view = new ThreeStrikes.Views.StrikeNew(model: @model)
    view.render()
    $modal = $("#modal")
    $modal.html(view.el)
    $modal.modal()

  delete: (event) =>
    event.preventDefault()
    @model.destroy({
      wait: true
      success: =>
        @remove()
    })
    

  edit: (event) =>
    event.preventDefault()
    view = new ThreeStrikes.Views.PeopleEdit(model: @model)
    view.render()
    $modal = $("#modal")
    $modal.html(view.el)
    $modal.one('hidden', -> view.leave())
    $modal.modal()

  leave: ->
    @unbindFromAll()
    super
