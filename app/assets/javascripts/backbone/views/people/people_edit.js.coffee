class ThreeStrikes.Views.PeopleEdit extends Support.CompositeView
  template: JST['people/edit']
  
  events:
    'click .save': 'save'

  render: =>
    $(@el).html(@template(@model.toJSON()))
    this

  save: (event) ->
    event.preventDefault()

    @model.save({
      name: $('#name').val()
    }, {
      wait: true
      success: =>
        $("#modal").modal('hide')
      error: @showErrors
    })

  showErrors: (model, response, options) =>
    error = JSON.parse(response.responseText)
    new ThreeStrikes.Views.Error({
      el: @$('.alert-error')
      model: new ThreeStrikes.Models.Error(error)
    }).render()

  leave: =>
    @unbindFromAll()
    super
