class ThreeStrikes.Views.StrikeNew extends Support.CompositeView
  template: JST['strikes/new']

  events:
    'click .strike': 'strike'

  render: =>
    $(@el).html(@template(@model.toJSON()))
    this

  strike: (event) ->
    event.preventDefault()

    @model.strikes.create({
      person_id: @model.id
      reason: $('#reason').val()
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

  leave: ->
    @unbindFromAll()
    super
