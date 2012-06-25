class ThreeStrikes.Views.PeopleNew extends Support.CompositeView
  template: JST['people/new']
  
  events:
    'click .add-person': 'addPerson'
    'submit form': 'addPerson'

  initialize: ->
    @form = new Backbone.Form(model: new ThreeStrikes.Models.Person())

  render: =>
    $(@el).html(@template())
    @$('div.modal-body').append(@form.render().el)  
    this

  addPerson: (event) ->
    event.preventDefault()
    
    unless @form.validate()
      @collection.create(
        @form.getValue(), {
          wait: true
          success: =>
            $("#modal").modal('hide')
          error: @showErrors
        }
      )

  showErrors: (model, response, options) =>
    error = JSON.parse(response.responseText)
    new ThreeStrikes.Views.Error({
      el: @$('.alert-error')
      model: new ThreeStrikes.Models.Error(error)
    }).render()

  leave: =>
    @unbindFromAll()
    super
