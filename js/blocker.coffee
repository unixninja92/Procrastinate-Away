
class @Blocker
  constructor: ->
    @loggedIn = false
    @isWhitelist = false
    @list = []

  getList: -> @list

  addSite: (url) ->
    @list.push(url)

  removeSite: (url) ->
    index = @list.indexOf(url)
    @list.splice(index, 1) #removes from array

  isWhitelist: -> @isWhitelist

  block: (url) ->
    bool = @list.includes(url)
    if @isWhitelist then not bool else bool
