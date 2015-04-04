blocker = new Blocker()
xhr = new XMLHttpRequest()

@getBlocker = -> blocker

# chrome.cookies.onChanged.addListener((removed, cookie, cause) ->
#   if cookie.domain is "blocker.obscure.systems"
#     if removed
#       xhr.open("GET", "http", true)
#       xhr.onreadystatechange ->
#         newJson = JSON.parse(xhr.responseText) if xhr.readyState is 4
#       )

setInterval(->
  xhr.open("GET", "http://blocker.obscure.systems/get-todos", true)
  xhr.onreadystatechange ->
    newJson = JSON.parse(xhr.responseText) if xhr.readyState is 4
, 60000)

chrome.tabs.onCreated.addListener((tab) ->
  console.log("Hey!")
  blocker.run(tab)
  )

chrome.tabs.onActivated.addListener((info) ->
  chrome.tabs.get(info.tabId, (tab) ->
    console.log("Hey :/")
    blocker.run(tab)
    )
  )

chrome.tabs.onUpdated.addListener((tabId, changeInfo, tab) ->
  if changeInfo.status is 'loading'
    console.log("Yo")
    blocker.run(tab)
    )
