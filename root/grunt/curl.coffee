module.exports = (grunt) ->
  grunt.config 'curl',
    craft:
      src: 'https://download.craftcms.com/craft/2.6/2.6.2931/Craft-2.6.2931.zip'
      dest: '.tmp/craft.zip'
  return
