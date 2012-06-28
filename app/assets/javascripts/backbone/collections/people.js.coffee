class ThreeStrikes.Collections.People extends Backbone.Collection
  model: ThreeStrikes.Models.Person
  url: '/people'
  
  comparator: (person) ->
    person.get('name')
