module.exports = (grunt) ->
  grunt.config 'curl',
    craft:
      src: 'https://download.craftcms.com/craft/<%= global["craftMajor"] %>.<%= global["craftMinor"] %>/<%= global["craftMajor"] %>.<%= global["craftMinor"] %>.<%= global["craftBuild"] %>/Craft-<%= global["craftMajor"] %>.<%= global["craftMinor"] %>.<%= global["craftBuild"] %>.zip'
      dest: '.tmp/craft.zip'
  return
