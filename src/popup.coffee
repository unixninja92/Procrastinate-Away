blocker = getBlocker()

chrome.tabs.query({'active': true, 'lastFocusedWindow': true}, (tab) ->
  url = tab[0].url
  if tab? and url?
    console.log(url)
    $('#block-np').hide()
    if blocker.block(url)
      $('#block-blocked').show()
    else
      $('#block-not-blocked').show()
    )
