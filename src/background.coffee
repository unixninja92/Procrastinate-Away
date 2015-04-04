blocker = new Blocker()


@getBlocker = -> blocker

chrome.cookies.onChanged.addListener((removed, cookie, cause) ->
  )

chrome.tabs.onCreated.addListener((tab) ->
  )

chrome.tabs.onActivated.addListener((info) ->
  chrome.tabs.get(info.tabId, (tab) ->
    )
  )

chrome.tabs.onUpdated.addListener((tabId, changeInfo, tab) ->
  if changeInfo.status is 'loading'
    )
