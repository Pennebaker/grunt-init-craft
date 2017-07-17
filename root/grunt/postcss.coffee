autoprefixer = require('autoprefixer')
cssnano = require('cssnano')

module.exports = (grunt) ->
  grunt.config 'postcss',
    dist:
      options:
        processors: [
          autoprefixer({browsers: 'last 3 versions'})
          cssnano()
        ]
      src: 'dist/public/assets/styles/*.css'
    dev:
      options:
        processors: [
          autoprefixer({browsers: 'last 3 versions'})
        ]
        map:
          inline: false
      src: 'dist/public/assets/styles/*.css'
  return
