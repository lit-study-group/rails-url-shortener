$ ->
  client = new ZeroClipboard($("#copy-btn"))

  client.on 'load', (client) ->
    client.on 'datarequested', (client) ->
      client.setText $('#site-url').text().trim()

    client.on 'complete', (client, args) ->
      $('#url-copied').show()
      setTimeout ( -> $('#url-copied').hide()), 2000


