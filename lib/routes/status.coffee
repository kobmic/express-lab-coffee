
express = require 'express'
router = express.Router()

router.get '/', (req, res) ->
    res.send({ health: 'good'})

module.exports = router
