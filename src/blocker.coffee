


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


  getList: -> @list

  parseJson: (json) ->
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
