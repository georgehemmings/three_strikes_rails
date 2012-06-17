class ThreeStrikes.Views.StrikeItem extends Support.CompositeView
  template: JST['strikes/item']
  tagName: 'tr'

  render: =>
    $(@el).html(@template(@model))
    this
