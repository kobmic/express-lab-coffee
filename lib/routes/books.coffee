express = require 'express'
router = express.Router()

bookModel = require '../models/book'

lookupBookOr404 = (req, res, next) ->
    books = bookModel.findById(req.params.id)
    return res.status(404).end() unless (books.length > 0)
    return res.status(409).end() if (books.length > 1)
    req.book = books[0]
    next()


router.get '/', (req, res) ->
    books = bookModel.find()
    res.status(200).json({ books: books})

router.get '/:id', lookupBookOr404, (req, res) ->
    res.status(200).json({ book: req.book})

router.delete '/:id', lookupBookOr404, (req, res) ->
    bookModel.deleteById(req.params.id)
    res.status(204).end()


module.exports = router
