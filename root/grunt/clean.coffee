module.exports = (grunt) ->
  grunt.config 'clean',
    main: [
      'dist/craft/templates/*'
      'dist/public/assets'
      'dist/public/media'
      '.tmp'
    ]
    craftPostInstall: [
      'dist/craft/templates/*'
      'dist/public/htaccess'
      'dist/public/robots.txt'
      'dist/readme.txt'
    ]
  return
