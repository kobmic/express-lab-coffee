books = [{
    id: 'geb'
    title: 'Gödel, Escher, Bach: an Eternal Golden Braid'
    author: 'Douglas Hofstadter'
    },
    {
        id: 'bof'
        title: 'The Beginning of Infinity, Explanations That Transform the World'
        author: 'David Deutsch'
    },
    {
        id: 'zam'
        title: 'Zen and the Art of Motorcycle Maintenance'
        author: 'Robert Pirsig'
    },
    {
        id: 'fbr'
        title: 'Fooled by Randomness'
        author: 'Nicholas Taleb'
    }]

find = () -> books

findById = (id) ->
    books.filter (book) -> (book.id == id)

deleteById = (id) ->
    #FIXME


module.exports =
    find: find
    findById: findById
    deleteById: deleteById


