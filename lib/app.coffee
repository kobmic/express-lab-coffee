express = require 'express'
morgan = require 'morgan'
bodyParser = require 'body-parser'

statusRoute = require './routes/status'
booksRoute = require './routes/books'

debug = require('debug')('express-lab-coffee:server')

app = express()

app.use(morgan('dev'))
app.use(bodyParser.json())

# Middleware and routes are added with use
app.use('/books', booksRoute)
app.use('/status', statusRoute)


environment = () ->
    process.env.NODE_ENV || 'development'

isProduction= () ->
    environment() == 'production'


# Utility function to show middleware and routes
# DEBUG=express-lab* npm start
printRoutes = () ->
    middleware = app._router.stack.map (route) ->
        if route.route then route.route.path else route.name + ': ' + route.regexp
    debug('Middleware')
    debug('\n' + middleware.join('\n') + '\n')

start = () ->
    port = process.env.PORT || 3000

    printRoutes()

    app.listen port, () ->
        console.log "#{environment().toUpperCase()} server started"
        console.log "Node.js version:  #{process.version}"
        console.log "Port: #{port}"
        console.log "URL: http://localhost:#{port}"

start()

module.exports = app