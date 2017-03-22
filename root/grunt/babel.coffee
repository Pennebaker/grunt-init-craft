module.exports = (grunt) ->
  grunt.config 'babel',
    options:
      sourceMap: true
      presets: [
        ['es2015', {modules:false}]
        'stage-2'
      ]
    dist:
      options:
        sourceMap: false
      files:
        'dist/public/assets/scripts/main.js': 'src/assets/scripts/main.js'
    dev:
      files:
        'dist/public/assets/scripts/main.js': 'src/assets/scripts/main.js'
  return
