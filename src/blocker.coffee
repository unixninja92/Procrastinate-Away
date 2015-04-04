


class @Blocker
  constructor: ->
    @loggedIn = false
    @isWhitelist = false
    @list = [
      'cnn.com',
      'yahoo.com'
    ]
    @areBlocking = yes
    @toPage = false
    @message = ""

  getMessage: -> @message

  reload: ->
    StorageArea.get("todos", (items) ->
      items.length
      # for num in [0..length-1]
      @list = items[0]
      )

  isLoggedIn: ->
    chrome.cookies.get({url:"http://blocker.obscure.systems/", name:"token" })

  getList: -> @list

  parseJson: (json) ->
    @areBlocking = yes
    @message = json.message
    @list = json.urls
    @isWhitelist = json.whitelist
  # addSite: (url) ->
  #   @list.push(url)
  #
  # removeSite: (url) ->
  #   index = @list.indexOf(url)
  #   @list.splice(index, 1) #removes from array

  isWhitelist: -> @isWhitelist

  makePattern: (url) -> ///^
    (https?:\/\/)?
    ([\da-z\.-]+)?
    #{url}
    ([\/\w \.-]*)*
    \/?
    $///

  block: (id, url) ->
    if @toPage
      console.log("page")
      # chrome.tabs.update(id, {url:""})
    else
      console.log("rediret")
      chrome.tabs.update(id, {url:chrome.extension.getURL('blocked.html')})


  checkUrl: (id, url, testmode) ->
    if @list?
      bool = false
      for domain in @list
        if url.match @makePattern domain
          bool = true
          break
      if @isWhitelist then bool = not bool
      console.log("test")
      if not testmode and bool
        @block id, url
      bool

  run: (tab) ->
    return false if not @areBlocking
    @checkUrl tab.id, tab.url, false
