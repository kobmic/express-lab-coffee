
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


describe 'GET /books/:id', ->

    it 'responds with 404 if book not found', (done) ->
        request(app)
        .get('/books/abc')
        .expect(404)
        .end (err, res) ->
                throw err if (err)
                done()

    it 'responds with the book', (done) ->
        request(app)
        .get('/books/bof')
        .expect(200)
        .expect('Content-Type', /json/)
        .end (err, res) ->
                throw err if (err)
                expect(res.body.book.id).to.equal('bof')
                done()

describe 'DELETE /books/:id', ->

    it 'responds with 404 if book not found', (done) ->
        request(app)
        .del('/books/abc')
        .expect(404)
        .end (err, res) ->
                throw err if (err)
                done()

    it 'deletes the book', (done) ->
        request(app)
        .del('/books/bof')
        .expect(204)
        .end (err, res) ->
                throw err if (err)
                done()
