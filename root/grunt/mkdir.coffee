module.exports = (grunt) ->
  grunt.config 'mkdir',
    all:
      options:
        create: ['dist/public/media']
  return
