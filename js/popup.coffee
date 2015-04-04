blocker = new Blocker()

chrome.tabs.getCurrent( (tab) ->
  if tab? and tab.url?
    $('block-np').hide()
    if blocker.block(tab.url)
      $('block-blocked').show()
    else
      $('block-not-blocked').show()
    )
