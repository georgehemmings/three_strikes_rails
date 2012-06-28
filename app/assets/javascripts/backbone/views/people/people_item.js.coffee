class ThreeStrikes.Views.PeopleItem extends Support.CompositeView
  template: JST['people/item']
  tagName: 'tr'

  initialize: ->
    @bindTo(@model, 'change', @render)
    @bindTo(@model, 'add:strikes', @render)

  render: =>
    $(@el).html(@template(@model))
    this

  leave: ->
    @unbindFromAll()
    super
