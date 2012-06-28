class ThreeStrikes.Views.PeopleEdit extends Support.CompositeView
  template: JST['people/edit']

  events:
    'click .save': 'save'
    
  initialize: ->
    @form = new Backbone.Form(model: @model)

  render: =>
    $(@el).html(@template())
    @$('div.modal-body').append(@form.render().el)  
    this

  save: (event) ->
    event.preventDefault()
    
    @clearErrors()

    unless @form.validate()
      @model.save(
        @form.getValue(), {
          wait: true
          success: =>
            $("#modal").modal('hide')
            @collection.sort()
          error: @showErrors
        }
      )

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
