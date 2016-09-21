module.exports = (grunt) ->
  grunt.config 'copy',
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
    css:
      files: [
          {
            expand: true
            cwd: 'dist/public/assets/styles'
            src: 'blocking.css'
            dest: 'dist/craft/templates/styles'
            filter: 'isFile'
          }
      ]
    main:
      files: [
        {
          expand: true
          cwd: 'bower_components/loadcss/src'
          src: '*.js'
          dest: 'dist/craft/templates/scripts'
          filter: 'isFile'
        }
        {
          # Assets, except .scss files
          expand: true
          cwd: 'src/assets'
          src: ['**', '!**/*.scss']
          dest: 'dist/public/assets'
          filter: 'isFile'
        }
        {
          # Ionicon Fonts
          expand: true
          cwd: 'bower_components/Ionicons'
          src: 'fonts/**'
          dest: 'dist/public/assets'
          filter: 'isFile'
        }
        {
          # Font Awesome Fonts
          expand: true
          cwd: 'bower_components/font-awesome'
          src: 'fonts/**'
          dest: 'dist/public/assets'
          filter: 'isFile'
        }
        {
          # Slick Slider Fonts
          expand: true
          cwd: 'bower_components/slick-carousel/slick'
          src: 'fonts/**'
          dest: 'dist/public/assets/styles'
          filter: 'isFile'
        }
        {
          # Slick Ajax Loader
          expand: true
          cwd: 'bower_components/slick-carousel/slick'
          src: 'ajax-loader.gif'
          dest: 'dist/public/assets/styles'
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
          # Redactor Configs
          expand: true
          cwd: 'content-models/redactor/configs'
          src: '**'
          dest: 'dist/craft/config/redactor'
          filter: 'isFile'
        }
        {
          # Generator Content Models
          expand: true
          cwd: 'content-models/models'
          src: '**'
          dest: 'dist/craft/plugins/thearchitect/content'
          filter: 'isFile'
        }
        {
          # Plugins { Old Method }
          expand: true
          cwd: 'src/craft_config'
          src: '**'
          dest: 'dist/craft'
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
        {
          # Docs files
          expand: true
          cwd: 'docs/_book'
          src: '**'
          dest: 'dist/public/docs'
        }
      craft_plugins:
        {
          # Blueprint Plugin
          expand: true
          cwd: 'craft_plugins/craftcms-blueprint'
          src: '**'
          dest: 'dist/craft/plugins/blueprint'
          filter: 'isFile'
        }
        {
          # The Architect Plugin
          expand: true
          cwd: 'craft_plugins/craftcms-thearchitect'
          src: 'thearchitect/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # CPFieldLinks Plugin
          expand: true
          cwd: 'craft_plugins/CpFieldLinks-Craft'
          src: 'cpfieldlinks/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Neo Plugin
          expand: true
          cwd: 'craft_plugins/craft-neo'
          src: 'neo/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Super Table Plugin
          expand: true
          cwd: 'craft_plugins/SuperTable'
          src: 'supertable/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Fruit LinkIt
          expand: true
          cwd: 'craft_plugins/LinkIt'
          src: 'fruitlinkit/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # SEOmatic Plugin
          expand: true
          cwd: 'craft_plugins'
          src: 'seomatic/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Field Notes Plugin
          expand: true
          cwd: 'craft_plugins/CraftFieldNotes'
          src: 'fieldnotes/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Imager Plugin
          expand: true
          cwd: 'craft_plugins/Imager-Craft'
          src: 'imager/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Control Panel CSS Plugin
          expand: true
          cwd: 'craft_plugins/craft-cpcss'
          src: 'cpcss/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Expanded Singles Plugin
          expand: true
          cwd: 'craft_plugins/ExpandedSingles'
          src: 'expandedsingles/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Redactor Extras Plugin
          expand: true
          cwd: 'craft_plugins/Redactor-Extras'
          src: 'redactorextras/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Contact Form Plugin
          expand: true
          cwd: 'craft_plugins/ContactForm'
          src: 'contactform/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Sitemap Plugin
          expand: true
          cwd: 'craft_plugins/craft-sitemap'
          src: 'sitemap/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Cache Clear Plugin
          expand: true
          cwd: 'craft_plugins/craft.cache-clear'
          src: '**'
          dest: 'dist/craft/plugins/cacheclear'
          filter: 'isFile'
        }
        {
          # Relabel Plugin
          expand: true
          cwd: 'craft_plugins/craft-relabel'
          src: 'relabel/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Reasons Plugin
          expand: true
          cwd: 'craft_plugins/Reasons-Craft'
          src: 'reasons/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Navee Plugin
          expand: true
          cwd: 'craft_plugins/navee'
          src: '**'
          dest: 'dist/craft/plugins/navee'
          filter: 'isFile'
        }
        {
          # FocusPoint Plugin
          expand: true
          cwd: 'craft_plugins/Craft-FocusPoint'
          src: 'focuspoint/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Instant Analytics Plugin
          expand: true
          cwd: 'craft_plugins/instantanalytics'
          src: '**'
          dest: 'dist/craft/plugins/instantanalytics'
          filter: 'isFile'
        }
        {
          # Minify Plugin
          expand: true
          cwd: 'craft_plugins/minify'
          src: '**'
          dest: 'dist/craft/plugins/minify'
          filter: 'isFile'
        }
        {
          # Cookies Plugin
          expand: true
          cwd: 'craft_plugins/cookies'
          src: '**'
          dest: 'dist/craft/plugins/cookies'
          filter: 'isFile'
        }
      ]
  return
