class ThreeStrikes.Views.PeopleNew extends Support.CompositeView
  template: JST['people/new']
  
  events:
    'click .add-person': 'addPerson'
    'submit form': 'addPerson'
  
  render: ->
    $(@el).html(@template(@model))
    this

  addPerson: (event) ->
    event.preventDefault()

    @collection.create({
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
