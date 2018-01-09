module.exports = (grunt) ->

  grunt.initConfig
    clean:
      ["build"]

    jade:
      compile:
        files: [{
          src: '**/*.jade',
          cwd: 'app',
          dest: 'build/',
          expand: true,
          ext: '.html',
        }]

    coffee:
      options:
        bare: true
        join: true
      compile:
        files:
          'build/app.js': 'app/src/*.coffee'

    stylus:
      compile:
        options:
          paths: [
            "lib/bootstrap-stylus/stylus/"
          ]
        files:
          'build/app.css': 'app/styles/*.styl'

    bower_concat:
      all:
        dest: 'build/components.js'
        exclude: "bootstrap-stylus"

    connect:
      server:
        options:
          port: 3000
          base: './build'
          open: true

    watch:
      options:
        livereload: true
      js:
        files: 'app/src/**/*.coffee'
        tasks: 'coffee'
      css:
        files: 'app/styles/**/*.styl'
        tasks: 'stylus'
      jade:
        files: 'app/**/*.jade'
        tasks: 'jade'

  require('load-grunt-tasks')(grunt);

  grunt.registerTask 'build', ['clean', 'jade', 'coffee', 'stylus', 'bower_concat']
  grunt.registerTask 'default', ['build', 'connect', 'watch']
