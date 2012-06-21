class ThreeStrikes.Routers.People extends Support.SwappingRouter
  el: $('#container')

  routes:
    '': 'index'
    'people/:id': 'show'

  initialize: ->
    @collection = new ThreeStrikes.Collections.People()
    @collection.reset($('#container').data('people'))

  index: ->
    view = new ThreeStrikes.Views.PeopleIndex(collection: @collection)
    @swap(view)

  show: (personId) ->
    person = @collection.get(personId)
    view = new ThreeStrikes.Views.PeopleShow({
      model: person
    })
    @swap(view)
