class ThreeStrikes.Views.PeopleIndex extends Support.CompositeView
  template: JST['people/index']

  events:
    'click #add-person': 'addPerson'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @render, this)

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
