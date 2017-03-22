module.exports = (grunt) ->

  global['craftMajor'] = 2
  global['craftMinor'] = 6
  global['craftBuild'] = 2958

  # Automatically loads all Grunt tasks
  require('load-grunt-tasks')(grunt)

  grunt.loadTasks 'grunt'

  grunt.registerTask 'craft_install', 'Downloads Craft and installs Craft', ->
    grunt.task.run ['curl:craft', 'unzip:craft', 'copy:craft_install', 'clean', 'copy:craft']

  grunt.registerTask 'update_craft', 'Checks if craft is already installed', ->
    if grunt.file.exists('dist/craft/app/Info.php')
      grunt.task.run ['grunt-if-contains:check_craft_version']
    else
      grunt.task.run ['craft_install']

  grunt.registerTask 'install', ['bower_install', 'update_craft']
  grunt.registerTask 'build', ['build-dev', 'babel:dist', 'uglify', 'cssmin', 'assets_hash']
  grunt.registerTask 'build-dev', ['install', 'clean:main', 'mkdir', 'fontello:dist', 'regex-replace:fontello',  'copy:main', 'babel:dev', 'copy:loadjs', 'copy:vendor', 'copy:craft_plugins', 'copy:craft', 'csscomb', 'sass', 'csscount', 'copy:css']
  grunt.registerTask 'default', ['build-dev', 'assets_hash', 'watch']
