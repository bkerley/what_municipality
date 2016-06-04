jQuery ($) ->
  muni_div = $ '#municipality'

  if !navigator.geolocation
    muni_div.text = "Geolocation isn't available in this browser."
    return

  ajax =
    success: (data, status, jqx)->
      muni_div.text data.name
  geo =
    success: (position) ->
      $.ajax
        url: '/find'
        dataType: 'json'
        data: position.coords
        success: ajax.success
    error: (msg) ->
      muni_div.text "Weird geo error: #{msg}"

  navigator.geolocation.getCurrentPosition(geo.success, geo.error)
