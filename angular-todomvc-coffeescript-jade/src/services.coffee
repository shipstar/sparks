'use strict'

angular.module('todomvc').factory 'todoStorage', ->
  STORAGE_ID = 'todos-angularjs'

  get: ->
    JSON.parse(localStorage.getItem(STORAGE_ID) || '[]')

  put: (todos) ->
    localStorage.setItem(STORAGE_ID, JSON.stringify(todos))