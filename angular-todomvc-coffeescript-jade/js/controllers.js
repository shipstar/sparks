// Generated by CoffeeScript 1.4.0
(function() {
  'use strict';

  angular.module('todomvc').controller('TodoCtrl', [
    '$scope', '$location', 'todoStorage', 'filterFilter', function($scope, $location, todoStorage, filterFilter) {
      var todos;
      todos = $scope.todos = todoStorage.get();
      $scope.newTodo = '';
      $scope.$watch('todos', function() {
        $scope.remainingCount = todos.filter(function(todo) {
          return !todo.completed;
        }).length;
        $scope.completedCount = todos.length - $scope.remainingCount;
        $scope.allCompleted = !$scope.remainingCount;
        return todoStorage.put(todos);
      }, true);
      $scope.location = $location;
      $scope.$watch('location.path()', function(path) {
        return $scope.statusFilter = (function() {
          switch (path) {
            case '/active':
              return {
                completed: false
              };
            case '/completed':
              return {
                completed: true
              };
          }
        })();
      });
      $scope.addTodo = function() {
        var newTodo;
        newTodo = $scope.newTodo.trim();
        if (!newTodo.length) {
          return;
        }
        todos.push({
          text: newTodo,
          completed: false
        });
        return $scope.newTodo = '';
      };
      $scope.removeTodo = function(todo) {
        return todos.splice(todos.indexOf(todo), 1);
      };
      $scope.markAll = function(value) {
        var todo, _i, _len, _results;
        _results = [];
        for (_i = 0, _len = todos.length; _i < _len; _i++) {
          todo = todos[_i];
          _results.push(todo.completed = value);
        }
        return _results;
      };
      return $scope.clearCompleted = function() {
        return todos = $scope.todos = todos.filter(function(todo) {
          return !todo.completed;
        });
      };
    }
  ]);

}).call(this);
