# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require twitter/bootstrap
#= require_tree .
impossible_sounds =
  nasal:
    ["pharyngeal", "epiglottal", "glottal"]
  sibilant:
    ["bilabial", "labio_dental", "palatal", "velar", "uvular", "pharyngeal", "epiglottal", "glottal"]
  flap:
    ["velar", "pharyngeal", "glottal"]
  trill:
    ["velar", "pharyngeal", "glottal"]
  "lateral.fricative":
    ["bilabial", "labio_dental",  "pharyngeal", "epiglottal", "glottal"]
  "lateral.approximant":
    ["bilabial", "labio_dental",  "pharyngeal", "epiglottal", "glottal"]
  "lateral.flap":
    ["bilabial", "labio_dental", "epiglottal"]

page_ready = ->
  for manner, places of impossible_sounds
    for place in places
      classes = ".#{manner}.#{place}"
      if (manner.search /lateral/) is -1
        classes += ":not(.lateral)"
      td = $(classes)
      td.addClass("impossible")
      td_span = $("<span>&mdash;</span>")
      td_span.addClass("tooltipped")
      td_span.attr("data-title", "Articulation judged to be impossible.")
      td.append(td_span)

  $(".tooltipped").tooltip()
  $("td.sound").each ->
    sound = $(this)
    fq = parseFloat(sound.find("span").attr("data-frequency"))
    opacity = (fq * 0.6)
    if opacity > 0
      opacity += 0.1
    sound.css("background-color", "rgba(247, 128, 147,#{opacity}")


$(document).on "page:load", page_ready
$(document).on "ready", page_ready
