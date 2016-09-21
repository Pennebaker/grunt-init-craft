module.exports = (grunt) ->
  grunt.config 'gitbook',
    main:
      input: 'docs'
      output: 'dist/public/docs'
  return
