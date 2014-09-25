'use strict';

var CoffeeScript = require('coffee-script');
CoffeeScript.register();

var app = require('./lib/app');

// Make sure uncaught exceptions are logged on exit
process.on('uncaughtException', function(err) {
    console.log("Uncaught exception", err, err.stack);
    process.exit(1);
});




