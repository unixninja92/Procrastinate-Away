blocker = new Blocker()
xhr = new XMLHttpRequest()

@getBlocker = -> blocker

chrome.cookies.onChanged.addListener((removed, cookie, cause) ->
  if cookie.domain is ""
    if removed
      xhr.open("GET", "http", true)
      xhr.onreadystatechange ->
        newJson = JSON.parse(xhr.responseText) if xhr.readyState is 4
      )

chrome.tabs.onCreated.addListener((tab) ->
  blocker.run(tab)
  )

chrome.tabs.onActivated.addListener((info) ->
  chrome.tabs.get(info.tabId, (tab) ->
    blocker.run(tab)
    )
  )

chrome.tabs.onUpdated.addListener((tabId, changeInfo, tab) ->
  blocker.run(tab) if changeInfo.status is 'loading'
    )
