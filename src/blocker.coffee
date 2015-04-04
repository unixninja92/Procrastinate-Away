
class @Blocker
  constructor: ->
    @loggedIn = false
    @isWhitelist = false
    @list = [
      'cnn.com'
    ]
    @areBlocking = false


  getList: -> @list

  parseJson: (json) ->
  # addSite: (url) ->
  #   @list.push(url)
  #
  # removeSite: (url) ->
  #   index = @list.indexOf(url)
  #   @list.splice(index, 1) #removes from array

  isWhitelist: -> @isWhitelist

  blockToMessage: (id, url) ->

  blockToPage: (id, url, page) ->

  isBlocked: (url, regex, time) ->

  checkUrl: (id, url, testmode) ->
    if @list?
      bool = @list.indexOf(url) isnt -1
      if @isWhitelist then not bool else bool

  run: (tab) ->
    return false if not @areBlocking
    checkUrl tab.id, tab.url, false
