angular.module('booknotesApp', ['ngRoute'])
  .config ($routeProvider, $locationProvider) ->

    $routeProvider
      .when '/',
        templateUrl: '/views/books/index.html'
        controller: 'BookListCtrl'
      .when '/books/new',
        templateUrl: '/views/books/new.html'
        controller: 'NewBookCtrl'
      .when '/books/:id',
        templateUrl: '/views/books/show.html'
        controller: 'BookDetailCtrl'
      .otherwise
        redirectTo: '/'

