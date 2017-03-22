module.exports = (grunt) ->
  if global['craftMajor'] == 2 and global['craftMinor'] > 5 and global['craftBuild'] > 2950
    craftIfContains = "define('CRAFT_VERSION', '" + global['craftMajor'] + '.' + global['craftMinor'] + '.' + global['craftBuild'] + "');"
  else
    craftIfContains = "define('CRAFT_BUILD', '" + global['craftBuild'] + "')"
  grunt.config 'grunt-if-contains',
    check_craft_version:
      src: ['dist/craft/app/Info.php']
      options:
        matchMode: 1
        ifContains: craftIfContains
        tasks:
          'craft_install': {}

  return
