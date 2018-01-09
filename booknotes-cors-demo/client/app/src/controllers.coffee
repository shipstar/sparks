angular.module('booknotesApp')
  .controller 'BookListCtrl', ($scope, Book) ->
    $scope.books = Book.all()

  .controller 'BookDetailCtrl', ($scope, $routeParams, Book) ->
    $scope.book = Book.find $routeParams.id

    $scope.blankNote = ->
      $scope.book.notes.unshift
        time: null
        text: ""

    $scope.saveNote = (note) ->
      note.time = (new Date).getTime()

  .controller 'NewBookCtrl', ($scope, $location, $http, Book) ->
    $scope.book = new Book

    $scope.create = ->
      Book.create $scope.book
      $location.path "/books/#{$scope.book.id}"

    lookupCover = (title) ->
      if _.isEmpty(title)
        $scope.book.author = null
        $scope.book.thumbnailUrl = null
        $scope.$digest()
      else
        $http
          url: "https://www.googleapis.com/books/v1/volumes?q=#{title}"
          method: "GET"
        .success (data) ->
          $scope.book.thumbnailUrl = data.items[0].volumeInfo.imageLinks.thumbnail
          $scope.book.author = data.items[0].volumeInfo.authors.join(", ")

    $scope.lookupInfo = _.debounce lookupCover, 300
