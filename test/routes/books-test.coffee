
request = require 'supertest'
expect = require('chai').expect
sinon = require 'sinon'
express = require 'express'
routes = require '../../lib/routes/books'

app = require '../../lib/app'

describe 'GET /books', ->
    before () ->
        # sinon.spy(Model, 'generate')

    it 'responds with books list', (done) ->
        request(app)
        .get('/books')
        .expect(200)
        .expect('Content-Type', /json/)
        .end (err, res) ->
                throw err if (err)
                expect(res.body.books.length).to.equal(4)
                done()

    after () ->
        # Model.generate.restore()

