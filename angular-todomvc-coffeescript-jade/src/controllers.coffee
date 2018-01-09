'use strict'

angular.module('todomvc').controller('TodoCtrl', [
  '$scope', '$location', 'todoStorage', 'filterFilter'

  ($scope, $location, todoStorage, filterFilter) ->
    todos = $scope.todos = todoStorage.get()

    $scope.newTodo = ''

    $scope.$watch 'todos', ->
      $scope.remainingCount = todos.filter((todo) -> !todo.completed).length
      $scope.completedCount = todos.length - $scope.remainingCount
      $scope.allCompleted = !$scope.remainingCount
      todoStorage.put todos
    , true

    $scope.location = $location

    $scope.$watch 'location.path()', (path) ->
      $scope.statusFilter = switch path
        when '/active' then { completed: false }
        when '/completed' then { completed: true }

    $scope.addTodo = ->
      newTodo = $scope.newTodo.trim()
      return unless newTodo.length

      todos.push
        text: newTodo
        completed: false

      $scope.newTodo = ''

    $scope.removeTodo = (todo) ->
      todos.splice todos.indexOf(todo), 1

    $scope.markAll = (value) ->
      todo.completed = value for todo in todos

    $scope.clearCompleted = ->
      # needs to reset $scope.todos because filter returns a copy
      todos = $scope.todos = todos.filter (todo) -> !todo.completed

])