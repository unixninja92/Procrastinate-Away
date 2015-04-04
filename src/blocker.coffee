makePattern = (url) -> ///^
  (https?:\/\/)?
  ([\da-z\.-]+)?
  #{url}
  ([\/\w \.-]*)*
  \/?
  $///


class @Blocker
  constructor: ->
    @loggedIn = false
    @isWhitelist = false
    @list = [
      'cnn.com'
    ]
    @areBlocking = false
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

  block: (id, url) ->
    if toPage
      chrome.tabs.update(id, {url:""})
    else
      chrome.tabs.update(id, {url:chrome.extension.getURL('blocked.html')})


  checkUrl: (id, url, testmode) ->
    if @list?
      bool = false
      for domain in @list
        if url.match makePattern domain
          bool = true
          break
      if @isWhitelist then bool = not bool
      if testmode
        block id, url
      bool

  run: (tab) ->
    return false if not @areBlocking
    checkUrl tab.id, tab.url, false
