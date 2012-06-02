class ThreeStrikes.Views.StrikeNew extends Support.CompositeView
  template: JST['strikes/new']
  
  events: ->
    'click .strike': 'strike' 
  
  render: =>
    $(@el).html(@template(@model))
    this
    
  strike: (event) =>
    event.preventDefault()
    @model.strike()
    $("#modal").modal('hide')
