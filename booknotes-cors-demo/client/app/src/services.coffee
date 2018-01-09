angular.module('booknotesApp')
  .factory 'Book', ->
    class Book
      books = [
        new Book
          id: 1
          title: "Antifragile"
          author: "Nasim Taleb"
          thumbnailUrl: "http://bks5.books.google.com/books?id=5fqbz_qGi0AC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
          summary: """
            A book about endemic risk and recognizing high-upside,
            low-downside opportunities.
          """
          notes: [
            time: 1394742339665
            text: """
              Chapter 1

              Taleb introduces the concept of antifragility, which is when something gets stronger when exposed to stress. It is different from fragility (breaks under stress) and robustness (stays the same under stress).
            """
          ]

        new Book
          id: 2
          title: "The Creative Habit"
          author: "Twyla Tharp"
          thumbnailUrl: "http://bks5.books.google.com/books?id=Z9Iy6a4lkqYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
          notes: []

        new Book
          id: 3
          title: "Reality is Broken"
          author: "Jane McGonigal"
          thumbnailUrl: "http://bks0.books.google.com/books?id=yiOtN_kDJZgC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
          notes: []

        new Book
          id: 4
          title: "Agile Web Development with Rails"
          author: "Sam Ruby, Dave Thomas, David Heinemeier Hansson"
          thumbnailUrl: "http://bks3.books.google.com/books?id=ymiqnAEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"
          notes: []
      ]

      id = 4

      @all: ->
        books

      @find: (id) ->
        _.find @all(), (book) -> book.id == parseInt(id)

      @create: (book) ->
        book.id = id += 1
        books.push book

      constructor: ({ @id, @title, @author, @thumbnailUrl, @summary, @notes } = {}) ->

      getSummary: ->
        @summary || "No summary available."

      hasThumbnail: ->
        !_.isEmpty @thumbnailUrl
