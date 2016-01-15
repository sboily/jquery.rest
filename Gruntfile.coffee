module.exports = (grunt) ->
  grunt.initConfig
    uglify:
      options:
        mangle: true
        compress: {}
        sourceMap: true
        sourceMapIncludeSources: true
      build:
        src: 'dist/jquery.rest/**/*.js'
        dest: 'dist/jquery.rest.min.js'
    coffee:
      main:
        options:
          sourceMap: true
        expand: true
        cwd: 'src'
        src: ['**/*.coffee']
        dest: 'dist/jquery.rest/'
        ext: '.js'
      spec:
        options:
          bare: true
        expand: true
        cwd: 'spec_src'
        src: ['**/*.coffee']
        dest: 'spec/'
        ext: '.js'
    jasmine:
      src: [ 'dist/jquery.rest.min.js' ]
      options:
        specs: [ 'spec/*.js' ]
        vendor: [
          'vendor/jquery/dist/jquery.min.js',
          'vendor/jquery.rest/dist/1/jquery.rest.min.js',
          'vendor/knockout/dist/knockout.js',
          'vendor/sjcl/sjcl.js'
          ]
    watch:
      files: ['<%= coffee.main.src %>', '<%= coffee.spec.src %>']
      tasks: ['coffee', 'uglify']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['coffee', 'uglify']
  grunt.registerTask 'test', ['jasmine']
