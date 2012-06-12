class ThreeStrikes.Routers.People extends Backbone.Router
  routes:
    '': 'index'
    'people/:id': 'show'

  initialize: ->
    @collection = new ThreeStrikes.Collections.People()
    @collection.reset($('#container').data('people'))

  index: ->
    view = new ThreeStrikes.Views.PeopleIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (personId) ->
    person = @collection.get(personId)
    view = new ThreeStrikes.Views.PeopleShow({
      model: person
    })
    $('#container').html(view.render().el)

