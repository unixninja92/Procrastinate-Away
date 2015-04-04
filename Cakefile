# Blocker = require('./js/blocker')
# fs = require 'fs'
#
# {exec} = require 'child_process'
#
# task 'build', 'Build project from js/*.coffee to lib/*.js', ->
#   exec 'coffee --compile --output lib/ js/', (err, stdout, stderr) ->
#     throw err if err
#     console.log stdout + stderr
#
# task 'build-popup', 'Build popup.coffee', ->
#   require './js/blocker'
#   code = require './js/popup.coffee'.generate()
#   fs.writeFile "./lib/parser.js", code
fs     = require 'fs'
{exec} = require 'child_process'
util   = require 'util'

prodSrcCoffeeDir     = 'js'
# testSrcCoffeeDir     = 'test/src/coffee-script'

prodTargetJsDir      = 'lib'
# testTargetJsDir      = 'test/src/js'

prodTargetFileName   = 'app'
prodTargetCoffeeFile = "#{prodSrcCoffeeDir}/#{prodTargetFileName}.coffee"
prodTargetJsFile     = "#{prodTargetJsDir}/#{prodTargetFileName}.js"

prodCoffeeOpts = "--bare --output #{prodTargetJsDir} --compile #{prodTargetCoffeeFile}"
# testCoffeeOpts = "--output #{testTargetJsDir}"

prodCoffeeFiles = [
  'blocker'
  'popup'
]

task 'build', 'Build a single JavaScript file from prod files', ->
  util.log "Building #{prodTargetJsFile}"
  appContents = new Array remaining = prodCoffeeFiles.length
  util.log "Appending #{prodCoffeeFiles.length} files to #{prodTargetCoffeeFile}"

  for file, index in prodCoffeeFiles then do (file, index) ->
    fs.readFile "#{prodSrcCoffeeDir}/#{file}.coffee"
              , 'utf8'
              , (err, fileContents) ->
      util.log err if err

      appContents[index] = fileContents
      util.log "[#{index + 1}] #{file}.coffee"
      process() if --remaining is 0

  process = ->
    fs.writeFile prodTargetCoffeeFile
                 , appContents.join('\n\n')
                 , 'utf8'
                 , (err) ->
      util.log err if err

      exec "coffee #{prodCoffeeOpts}", (err, stdout, stderr) ->
        util.log err if err
          message = "Compiled #{prodTargetJsFile}"
          util.log message
          fs.unlink prodTargetCoffeeFile, (err) -> util.log err if err
