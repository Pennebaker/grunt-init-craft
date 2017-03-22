module.exports = (grunt) ->
  grunt.config 'assets_hash',
    assets:
      options:
        algorithm: 'sha256'
        jsonFile: 'dist/public/assets/hashmap.json'
        jsonOnly: true
        length: 8
        removeFromPath: 'dist/public'
      replace_in: [
        'dist/craft/templates/**/*.*'
      ]
      files: [{
        expand: true
        cwd: 'dist/public/assets'
        src: '**/*.*'
        dest: 'dist/public/assets'
      }]
  return
