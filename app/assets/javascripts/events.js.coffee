# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  found_you = (data) ->
    console.log data
    data =
      authenticity_token: $("meta[name]='csrf-token'")
      event:
        latitude:  data.coords.latitude
        longitude: data.coords.longitude

    $.post '/checkin', data, (post_result) ->
      console.log post_result

  did_not_find = (error) ->
    console.log error

  find_event = () ->
    if !navigator.geolocation
      console.log "Sorry, this devices does not allow us to use geolocation to find you."
      return

    navigator.geolocation.getCurrentPosition found_you, did_not_find,
      enableHighAccuracy: true

