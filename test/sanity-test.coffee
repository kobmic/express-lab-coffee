expect = require('chai').expect
sinon = require('sinon')

describe "sanity", ->

    it 'verifies the test setup', ->
        expect(2 + 40).to.equal(42)

    it 'verifies the test setup (async)', (done) ->
        setTimeout () ->
            expect(40 + 2).to.equal(42)
            done()
        , 200

