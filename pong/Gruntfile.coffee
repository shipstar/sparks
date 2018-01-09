module.exports = (grunt) ->
  
  grunt.initConfig

    pkg: '<json:package.json>'

    concat:
      dist:
        src: 'src/*.coffee'
        dest: 'build/main.coffee'

    coffee:
      options:
        bare: true
      compile:
        files:
          'compiled/main.js': 'build/main.coffee'

    uglify:
      my_target:
        files:
          'compiled/main.min.js': 'compiled/main.js'

    watch:
      files: 'src/*.coffee'
      tasks: 'build'

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-concat'

  grunt.registerTask 'default', 'watch'
  grunt.registerTask 'build', ['concat', 'coffee', 'uglify']