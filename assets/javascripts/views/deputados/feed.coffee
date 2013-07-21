window.DeputadosView ||= {}

class DeputadosView.Feed extends Support.CompositeView
  template: JST["deputados/feed"]

  initialize: (@deputado)->
    @feed = new DeputadoFeed @deputado.get('uri')
    @feed.fetch()
    @bindTo @feed, "reset change", @renderData

  render: =>
    return this

  renderData: =>
    $(@el).html @template(activities: @feed.toJSON(), deputado: @deputado.toJSON())
