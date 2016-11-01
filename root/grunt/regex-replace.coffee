module.exports = (grunt) ->
  grunt.config 'regex-replace',
    fontello:
      src: ['src/fontello/scss/_fontello.scss']
      actions: [
        {
          name: 'font-folder'
          search: /\/font\//gmi
          replace: (fullstring) ->
            '/fonts/'
        }
        {
          name: 'scss-varaibles'
          search: /^\.([a-z\-]+):before { content(: '\\[a-z0-9]+';) }(.*)$/gmi
          replace: (fullstring, codeName, code, comment) -> '$' + codeName + code + comment
        }
      ]
  return
