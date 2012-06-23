class ThreeStrikes.Views.PeopleIndex extends Support.CompositeView
  template: JST['people/index']

  events:
    'click #add-person': 'addPerson'

  initialize: ->
    @bindTo(@collection, 'reset', @render)
    @bindTo(@collection, 'add', @render)

  render: =>
    $(@el).html(@template)
    @collection.each( (person) =>
      row = new ThreeStrikes.Views.PeopleItem(model: person)
      @renderChild(row)
      @$('tbody').append(
        row.el
      )
    )
    this

  addPerson: =>
    event.preventDefault()
    view = new ThreeStrikes.Views.PeopleNew(collection: @collection)
    view.render()
    $modal = $("#modal")
    $modal.html(view.el)
    $modal.modal()

  leave: ->
    @unbindFromAll()
    super
