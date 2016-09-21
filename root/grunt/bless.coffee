module.exports = (grunt) ->
  grunt.config 'bless',
    css:
      options:
        force: true
      files: [{
        expand: true
        cwd: 'dist/public/assets'
        src: '**/*.css'
        dest: 'dist/public/assets'
      }]
  return
