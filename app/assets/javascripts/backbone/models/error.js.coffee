class ThreeStrikes.Models.Error extends Backbone.Model

  messages: ->
    _.flatten(
      _.map(@attributes.errors, (messages, fieldName) ->
        _.map(messages, (message) ->
          "#{fieldName.capitalize()} #{message}"
        )
      )
    )
