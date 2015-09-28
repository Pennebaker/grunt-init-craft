module.exports = (grunt) ->

  # Automatically loads all Grunt tasks
  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    curl:
      craft:
        src: 'http://download.buildwithcraft.com/craft/2.4/2.4.2691/Craft-2.4.2691.zip'
        dest: '.tmp/craft.zip'
    unzip:
      craft:
        src: '.tmp/craft.zip'
        dest: '.tmp/craft'
    watch:
      styles:
        files: ['src/assets/**/*.scss']
        tasks: ['compile_styles']
      scripts:
        files: ['src/assets/**/*.js']
        tasks: ['uglify']
      templates:
        files: ['src/templates/**/*.html', 'data/**/*.yml']
        tasks: ['copy:craft']
      static_files:
        files: ['src/assets/**', 'src/media/**', '!src/assets/**/*.scss', 'src/static_files/**']
        tasks: ['copy:main']
      craft_config:
        files: ['src/craft_config/**']
        tasks: ['copy:main']
      bower:
        files: ['bower.json', 'bower_components/*']
        tasks: ['bower_install', 'bower_concat']
      docs:
        files: ['docs/**']
        tasks: ['gitbook']
    sass:
      options:
        sourceMap: false
        includePaths: [
          'src/assets/styles'
          'bower_components/bourbon/app/assets/stylesheets'
          'bower_components/neat/app/assets/stylesheets'
          'bower_components/omega-reset-for-bourbon-neat/dist'
          'bower_components/normalize-scss'
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
    gitbook:
      main:
        input: 'docs'
        output: 'dist/public/docs'
    copy:
      main:
        files: [
          {
            # Assets, except .scss files
            expand: true
            cwd: 'src/assets'
            src: ['**', '!**/*.scss']
            dest: 'dist/public/assets'
            filter: 'isFile'
          }
          {
            # Media
            expand: true
            cwd: 'src/media'
            src: '**'
            dest: 'dist/public/media'
            filter: 'isFile'
          }
          {
            # Static files
            expand: true
            cwd: 'src/static_files'
            src: '**'
            dest: 'dist/public'
            dot: true
          }
        ]
      craft_install:
        files: [{
          expand: true
          cwd: '.tmp/craft'
          src: '**'
          dest: 'dist/'
        }]
      craft:
        files: [
          {
            # Craft config
            expand: true
            cwd: 'src/craft_config'
            src: '**'
            dest: 'dist/craft'
          }
          {
            # Templates
            expand: true
            cwd: 'src/templates'
            src: '**'
            dest: 'dist/craft/templates'
          }
        ]
    bower_concat:
      all:
        dest: 'dist/public/assets/scripts/vendor.js'
        cssDest: 'dist/public/assets/styles/vendor.css'
        exclude: [
          'bourbon'
          'neat'
          'normalize-scss'
          'omega-reset-for-bourbon-neat'
        ]
        mainFiles:
          'dropkick': 'lib/dropkick.js'
        dependencies:
          'dropkick': 'jquery'
    uglify:
      main:
        files: [{
          expand: true
          src: 'dist/public/assets/**/*.js'
        }]
    bless:
      css:
        options:
          force: true
        files: [{
          expand: true
          cwd: 'dist/public/assets'
          src: '**/*.css'
          dest: 'dist/public/assets'
        }]
    connect:
      rules: [{
        from: '(^[^.]{2,}$)'
        to: '$1.html'
      }]
      server:
        options:
          port: 9000
          base: 'dist/public'
          middleware: (connect, options) ->
            middlewares = []
            # RewriteRules support
            middlewares.push rewriteRulesSnippet
            if not Array.isArray options.base
            	options.base = [options.base]
            directory = options.directory || options.base[options.base.length - 1]
            options.base.forEach (base) ->
                # Serve static files.
                middlewares.push connect.static base
            # Make directory browse-able.
            middlewares.push connect.directory directory
            middlewares
    configureRewriteRules:
      options:
        rulesProvider: 'connect.rules'
    twigRender:
      prototypes:
        files: [{
          expand: true,
          data: ['data/prototypes.yml', 'data/local.yml']
          cwd: 'src/templates'
          src: ['**/*.html', '!**/_*.html'] # Match twig templates but not partials
          dest: 'dist/public'
          ext: '.html'
          }]
    clean:
      main: [
        'dist/craft/templates/*'
        'dist/public/assets'
        'dist/public/media'
        'dist/public/index.html' # kill the file added by apache2
        '.tmp'
      ]
      craftPostInstall: [
        'dist/craft/templates/*'
        'dist/public/htaccess'
        'dist/public/robots.txt'
        'dist/readme.txt'
      ]

  grunt.registerTask 'create_local_yml', 'Creates local.yml', ->
    local_yml_file = 'data/local.yml'
    if not grunt.file.exists local_yml_file
      grunt.file.write 'data/local.yml', ''

  grunt.registerTask 'craft_install', 'Downloads Craft and installs Craft', ->
    if grunt.file.exists('dist/craft') isnt true
      grunt.task.run ['curl:craft', 'unzip:craft', 'copy:craft_install', 'clean', 'copy:craft']




  grunt.registerTask 'install', ['bower_install', 'craft_install', 'create_local_yml']
  grunt.registerTask 'compile_styles', ['sass', 'bless']
  grunt.registerTask 'build', ['install', 'clean:main', 'copy:main', 'copy:craft', 'compile_styles', 'bower_concat', 'uglify']
  grunt.registerTask 'serve', ['configureRewriteRules', 'connect:server']
  grunt.registerTask 'default', ['build', 'watch']
