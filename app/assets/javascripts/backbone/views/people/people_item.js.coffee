class ThreeStrikes.Views.PeopleItem extends Support.CompositeView
  template: JST['people/item']
  tagName: 'tr'

  render: =>
    m = @model.toJSON()
    x = @template(m)
    $(@el).html(x)
    this
    