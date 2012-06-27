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

    @clearErrors()

    unless @form.validate()
      @collection.create(
        @form.getValue(), {
          wait: true
          success: @showPerson
          error: @showErrors
        }
      )
      
  showPerson: (model) ->
    $("#modal").modal('hide')
    window.location.hash = "#/people/#{model.id}"

  clearErrors: ->
    @$('.alert-error').empty().hide()

  showErrors: (model, response, options) =>
    error = JSON.parse(response.responseText)
    new ThreeStrikes.Views.Error({
      el: @$('.alert-error')
      model: new ThreeStrikes.Models.Error(error)
    }).render()

  leave: =>
    @unbindFromAll()
    super
