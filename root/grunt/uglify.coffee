module.exports = (grunt) ->
  grunt.config 'uglify',
    main:
      files: [{
        expand: true
        src: [
            'dist/public/assets/**/*.js'
            '!dist/public/assets/**/vue*'
        ]
        filter: 'isFile'
      }]
  return
