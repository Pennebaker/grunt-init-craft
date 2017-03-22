module.exports = (grunt) ->
  grunt.config 'sass',
    options:
      sourceMap: true
      includePaths: [
        'src/assets/styles'
        'bower_components/bourbon/app/assets/stylesheets'
        'bower_components/neat/app/assets/stylesheets'
        'bower_components/omega-reset-for-bourbon-neat/dist'
        'bower_components/normalize-scss'
        'bower_components/sass-web-fonts'
        'bower_components'
      ]
    dist:
      files: [{
        expand: true
        cwd: 'src/assets'
        src: '**/*.scss'
        dest: 'dist/public/assets'
        ext: '.css'
      }]
  return
