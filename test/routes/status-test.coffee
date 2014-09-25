request = require 'supertest'
expect = require('chai').expect
sinon = require 'sinon'
express = require 'express'
routes = require '../../lib/routes/status'

app = require '../../lib/app'

describe 'GET /status', ->
    before () ->
        # sinon.spy(Model, 'generate')

    it 'responds with health good', (done) ->
        request(app)
            .get('/status')
            .expect('Content-Type', /json/)
            .expect(200)
            .end (err, res) ->
                throw err if (err)
                expect(res.body.health).to.equal('good')
                done()

    after () ->
        # Model.generate.restore()

