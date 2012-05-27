#= require_self
#= require_tree ../../templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.ThreeStrikes =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    new ThreeStrikes.Routers.People()
    Backbone.history.start()

jQuery ->
  ThreeStrikes.init()
