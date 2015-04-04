
class @Blocker
  constructor: ->
    @loggedIn = false
    @isWhitelist = false
    @list = [
      'cnn.com'
    ]

  getList: -> @list

  addSite: (url) ->
    @list.push(url)

  removeSite: (url) ->
    index = @list.indexOf(url)
    @list.splice(index, 1) #removes from array

  isWhitelist: -> @isWhitelist

  block: (url) ->
    bool = @list.indexOf(url) isnt -1
    if @isWhitelist then not bool else bool
