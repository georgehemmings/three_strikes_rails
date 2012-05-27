class ThreeStrikes.Routers.People extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    @collection = new ThreeStrikes.Collections.People()
    @collection.reset($('#container').data('people'))

  index: ->
    view = new ThreeStrikes.Views.PeopleIndex(collection: @collection)
    $('#container').html(view.render().el)
