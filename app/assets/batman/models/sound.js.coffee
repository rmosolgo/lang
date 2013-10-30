class Lang.Sound extends Batman.Model
  @resourceName: 'sounds'
  @storageKey: 'sounds'

  @persist Batman.RailsStorage

  # Use @encode to tell batman.js which properties Rails will send back with its JSON.
  @encode 'letter'
  @encodeTimestamps()

