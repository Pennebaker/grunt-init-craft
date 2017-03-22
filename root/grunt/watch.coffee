module.exports = (grunt) ->
  grunt.config 'watch',
    static_files:
      files: ['src/assets/**', 'src/media/**', '!src/assets/**/*.scss', '!src/assets/**/*.js', 'src/static_files/**', 'src/plugins/**']
      tasks: ['copy:main', 'copy:css', 'assets_hash']
    styles:
      files: ['src/assets/**/*.scss']
      tasks: ['csscomb', 'sass', 'csscount', 'assets_hash']
    scripts:
      files: ['src/assets/**/*.js']
      tasks: ['babel:dev', 'assets_hash']
    templates:
      files: ['src/craft/**/*', 'src/templates/**/*.html', 'src/templates/**/*.twig', 'src/templates/**/*.js', ]
      tasks: ['copy:craft', 'assets_hash']
    craft_config:
      files: ['src/craft_config/**']
      tasks: ['copy:main']
    bower:
      files: ['bower.json', 'bower_components/*']
      tasks: ['bower_install']
    fontello:
      files: ['src/fontello/config.json']
      tasks: ['fontello:dist', 'regex-replace:fontello']
    docs:
      files: ['docs/**']
      tasks: ['gitbook']
  return
