module.exports = (grunt) ->
  grunt.config 'csscomb',
    options:
      config: '.csscomb.json'
    files:
      expand: true
      cwd: 'src/assets/styles'
      src: ['**/*.scss', '!**/_columnizer.scss']
      dest:'src/assets/styles'
