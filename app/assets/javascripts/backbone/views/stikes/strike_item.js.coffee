class ThreeStrikes.Views.StrikeItem extends Support.CompositeView
  template: JST['strikes/item']
  tagName: 'tr'

  events:
    'click .delete-strike': 'delete'
    'click .edit-strike': 'edit'

  initialize: ->
    @bindTo(@model, 'change', @render)

  render: =>
    $(@el).html(@template(@model.toJSON()))
    this

  delete: (event) =>
    event.preventDefault()
    @model.destroy({
      wait: true
      success: =>
        @remove()
    })

  edit: (event) =>
    event.preventDefault()
    view = new ThreeStrikes.Views.StrikeEdit(model: @model)
    view.render()
    $modal = $("#modal")
    $modal.html(view.el)
    $modal.one('hidden', -> view.leave())
    $modal.modal()

  leave: ->
    @unbindFromAll()
    super
