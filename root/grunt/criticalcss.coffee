module.exports = (grunt) ->
  grunt.config 'criticalcss',
    custom:
      options:
        url: 'http://example.dev'
        width: 1200
        height: 900
        outputfile: 'dist/public/assets/styles/critical.css'
        filename: 'dist/public/assets/styles/style.css'
        forceInclude: ['.fonts-loading', '@keyframes']
        buffer: 800*1024
        ignoreConsole: true
  return
