module.exports = (grunt) ->
  grunt.config 'fontello',
    dist:
      options:
        config: 'src/fontello/config.json'
        fonts   : 'dist/public/assets/fonts'
        styles  : 'src/fontello/scss'
        scss    : true
        force   : true
  return
