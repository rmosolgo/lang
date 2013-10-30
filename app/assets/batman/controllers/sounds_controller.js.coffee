class Lang.SoundsController extends Lang.ApplicationController
  routingKey: 'sounds'

  index: (params) ->
    @set("sounds", Lang.Sound.get('all'))

  show: (params) ->

  edit: (params) ->

  new: (params) ->

  create: (params) ->

  update: (params) ->

  destroy: (params) ->

