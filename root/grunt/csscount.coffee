module.exports = (grunt) ->
  grunt.config 'csscount',
    dev:
      src: [
        'dist/public/assets/styles/style.css'
      ]
      options:
        maxSelectors: 4000
        beForgiving: true
  return
