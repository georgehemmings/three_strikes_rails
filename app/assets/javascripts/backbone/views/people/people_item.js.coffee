class ThreeStrikes.Views.PeopleItem extends Support.CompositeView
  template: JST['people/item']
  tagName: 'tr'
  
  events: ->
    'click .strike': 'strike'
    
  initialize: ->
    @model.on('change', @render)

  render: =>
    $(@el).html(@template(@model))
    this
  
  strike: (event) =>
    event.preventDefault()
    @model.strike()
