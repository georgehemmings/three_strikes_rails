class ThreeStrikes.Views.StrikeNew extends Support.CompositeView
  template: JST['strikes/new']

  events:
    'click .strike': 'strike'

  initialize: ->
    @form = new Backbone.Form(
      model: new ThreeStrikes.Models.Strike(person_id: @model.id)
    )

  render: =>
    $(@el).html(@template())
    @$('div.modal-body').append(@form.render().el)  
    this

  strike: (event) ->
    event.preventDefault()

    @clearErrors()

    unless @form.validate()
      @model.get('strikes').create(
        @form.getValue(), {
          wait: true
          success: =>
            $("#modal").modal('hide')
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
