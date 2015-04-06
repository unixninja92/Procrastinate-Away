blocker = new Blocker()

@getBlocker = -> blocker

@getJson = ->
  console.log("Hey there ;)")
  xhr = new XMLHttpRequest()
  cookie = null
  chrome.cookies.get({url:"http://blocker.obscure.systems/", name:"token" },
  (cook) ->
    cookie = cook.value
    if not cookie?
      blocker.clearList()
      return
    xhr.open("GET", "http://blocker.obscure.systems/get-active-todos", true)
    xhr.setRequestHeader("Authorization", "Bearer " + cookie)
    xhr.onreadystatechange = ->
      # console.log(xhr.readyState, xhr.responseText)
      if xhr.responseText?
        newJson = JSON.parse(xhr.responseText).todos[0] #if xhr.readyState is 4
        console.log(newJson)
        blocker.parseJson(newJson)
        # StorageArea.set(xhr.responseText, null)
    xhr.send()
  )
  xhr

getJson()

setInterval(getJson, 6000)

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
