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

page_ready = ->
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
