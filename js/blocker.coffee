constants = {
  CREATE_USER: 'CREATE_USER',
  LOGIN_USER: 'LOGIN_USER'
}

class Blocker
  constructor: ->
    @loggedIn = false

  login: (@username, pass) ->
    $.post("url", )
