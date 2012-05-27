class ThreeStrikes.Views.PeopleIndex extends Support.CompositeView
  template: JST['people/index']
  
  initialize: ->
    @collection.on('reset', @render, this)

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
