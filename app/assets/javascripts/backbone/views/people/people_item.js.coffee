class ThreeStrikes.Views.PeopleItem extends Support.CompositeView
  template: JST['people/item']
  tagName: 'tr'
  
  events: ->
    'click .strike': 'strike'

  render: =>
    $(@el).html(@template(@model.toJSON()))
    this
  
  strike: (event) =>
    event.preventDefault()
    @model.strike()
