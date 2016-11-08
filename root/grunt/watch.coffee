module.exports = (grunt) ->
  grunt.config 'watch',
    styles:
      files: ['src/assets/**/*.scss']
      tasks: ['compile_styles-dev']
    scripts:
      files: ['src/assets/**/*.js']
      #tasks: ['uglify']
    templates:
      files: ['src/templates/**/*.html', 'src/templates/**/*.twig', 'data/**/*.yml']
      tasks: ['copy:craft']
    static_files:
      files: ['src/assets/**', 'src/media/**', '!src/assets/**/*.scss', 'src/static_files/**']
      tasks: ['copy:main', 'copy:css']
    craft_config:
      files: ['src/craft_config/**']
      tasks: ['copy:main']
    bower:
      files: ['bower.json', 'bower_components/*']
      tasks: ['bower_install', 'bower_concat']
    fontello:
      files: ['src/fontello/config.json']
      tasks: ['fontello:dist', 'regex-replace:fontello']
    docs:
      files: ['docs/**']
      tasks: ['gitbook']
  return
