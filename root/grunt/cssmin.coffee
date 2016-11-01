module.exports = (grunt) ->
  grunt.config 'cssmin',
    options:
      sourceMap: true
    files:
      expand: true
      cwd: 'dist/public/assets/styles'
      src: ['**/*.css']
      dest:'dist/public/assets/styles'
