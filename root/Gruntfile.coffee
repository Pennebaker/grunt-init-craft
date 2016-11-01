module.exports = (grunt) ->

  # Automatically loads all Grunt tasks
  require('load-grunt-tasks')(grunt)

  grunt.loadTasks 'grunt'

  grunt.registerTask 'craft_install', 'Downloads Craft and installs Craft', ->
    if grunt.file.exists('dist/craft') isnt true
      grunt.task.run ['curl:craft', 'unzip:craft', 'copy:craft_install', 'clean:craftPostInstall', 'copy:craft']

  grunt.registerTask 'install', ['bower_install', 'craft_install']
  grunt.registerTask 'craft-update', ['clean:craftPreUpdate', 'install']
  grunt.registerTask 'build', ['build-dev', 'uglify', 'criticalcss', 'cssmin']
  grunt.registerTask 'build-dev', ['install', 'clean:main', 'mkdir', 'fontello:dist', 'regex-replace:fontello', 'copy:main', 'copy:craft_plugins', 'copy:craft', 'sass', 'bower_concat', 'copy:css']
  grunt.registerTask 'default', ['build-dev', 'watch']
