exec = require('child_process').exec

task 'test', (options) =>
  exec "mocha --compilers coffee:coffee-script --colors --recursive", (error, stdout, stderr) ->
    console.log stdout
    console.log stderr