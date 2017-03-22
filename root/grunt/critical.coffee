# Exporting critical stylesheets to ./src/ since our buddy.works cannot currently generate these because it has no local dev site to load.
module.exports = (grunt) ->
  grunt.config 'critical',
    page:
      src: 'http://example.dev'
      dest: './src/templates/page_critical.css'
      options:
        width: 1200
        height: 900
    four_o_four:
      src: 'http://example.dev/404'
      dest: './src/templates/404_critical.css'
      options:
        width: 1200
        height: 900
  return
