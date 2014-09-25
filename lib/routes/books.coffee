express = require 'express'
router = express.Router()

bookModel = require '../models/book'

router.get '/', (req, res) ->
    books = bookModel.find()
    res.status(200).json({ books: books})

router.get '/:id', (req, res) ->
    books = bookModel.findById(req.params.id)
    res.status(200).json({ books: books})

module.exports = router
