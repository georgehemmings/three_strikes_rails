class ThreeStrikes.Views.StrikeItem extends Support.CompositeView
  template: JST['strikes/item']
  tagName: 'tr'

  events: ->
    'click .delete': 'delete'

  render: =>
    $(@el).html(@template(@model.toJSON()))
    this

  delete: (event) =>
    event.preventDefault()
    @model.destroy({
      wait: true
    })

