module.exports = (grunt) ->
  grunt.config 'uglify',
    main:
      files: [{
        expand: true
        src: 'dist/public/assets/**/*.js'
        filter: 'isFile'
      }]
  return
