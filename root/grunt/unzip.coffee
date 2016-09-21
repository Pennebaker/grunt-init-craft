module.exports = (grunt) ->
  grunt.config 'unzip',
    craft:
      src: '.tmp/craft.zip'
      dest: '.tmp/craft'
  return
