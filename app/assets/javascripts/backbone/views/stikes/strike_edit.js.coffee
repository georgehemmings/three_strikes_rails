class ThreeStrikes.Views.StrikeEdit extends Support.CompositeView
  template: JST['strikes/edit']

  events:
    'click .save': 'save'

  initialize: ->
    @bindTo(@model, 'change', @render)

  render: =>
    $(@el).html(@template(@model.toJSON()))
    this

  save: (event) ->
    event.preventDefault()

    @model.save({
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
