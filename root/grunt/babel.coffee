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
      files: [
        expand: true
        cwd: 'src/assets/scripts'
        src: ['*.es6']
        dest: 'dist/public/assets/scripts/'
        ext: '.js'
      ]
    dev:
      files: [
        expand: true
        cwd: 'src/assets/scripts'
        src: ['*.es6']
        dest: 'dist/public/assets/scripts/'
        ext: '.js'
      ]
  return
