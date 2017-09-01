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
          cwd: 'src/craft'
          src: '**'
          dest: 'dist/craft'
        }
        {
          # Craft locales
          expand: true
          cwd: 'src/craft_locale'
          src: '**'
          dest: 'dist/craft/app/framework/i18n/data'
        }
        {
          # Templates
          expand: true
          cwd: 'src/templates'
          src: '**'
          dest: 'dist/craft/templates'
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
          dest: 'dist/craft/config/thearchitect'
          filter: 'isFile'
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
    vendor:
      files: [
        {
          expand: true
          cwd: 'bower_components/video.js/dist'
          src: '**'
          dest: 'dist/public/assets/vendor/video-js'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/slick-carousel/slick'
          src: '**'
          dest: 'dist/public/assets/vendor/slick-carousel'
          filter: 'isFile'
        }
      ]
    loadjs:
      files: [
        {
          expand: true
          cwd: 'bower_components/modernizr'
          src: 'modernizr.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/matchMedia'
          src: 'matchMedia.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/video.js/dist'
          src: 'video.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/jquery/dist'
          src: 'jquery.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/matchHeight'
          src: 'jquery.matchHeight.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/jquery-placeholder'
          src: 'jquery.placeholder.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/sticky-kit/dist'
          src: 'sticky-kit.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/jquery.scrollTo'
          src: 'jquery.scrollTo.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/waypoints/lib'
          src: 'noframework.waypoints.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/waypoints/lib/shortcuts'
          src: 'inview.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/slick-carousel/slick'
          src: 'slick.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/flexibility'
          src: 'flexibility.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/lazysizes'
          src: 'lazysizes.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/lazysizes/plugins/bgset'
          src: 'ls.bgset.js'
          dest: 'dist/public/assets/scripts/lazysizes-plugins'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/lazysizes/plugins/respimg'
          src: 'ls.respimg.min.js'
          dest: 'dist/public/assets/scripts/lazysizes-plugins'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/dropkick/build/js'
          src: 'dropkick.min.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/es6-object-assign/dist'
          src: 'object-assign.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/vue/dist'
          src: 'vue.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/vue/dist'
          src: 'vue.min.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/lory/dist'
          src: 'lory.js'
          dest: 'dist/public/assets/scripts'
          filter: 'isFile'
        }
      ]
    main:
      files: [
        {
          expand: true
          cwd: 'bower_components/loadjs/dist'
          src: 'loadjs.min.js'
          dest: 'dist/craft/templates/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/loadcss/src'
          src: '*.js'
          dest: 'dist/craft/templates/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/cookie'
          src: 'cookie.js'
          dest: 'dist/craft/templates/scripts'
          filter: 'isFile'
        }
        {
          expand: true
          cwd: 'bower_components/fontfaceobserver'
          src: 'fontfaceobserver.js'
          dest: 'dist/craft/templates/scripts'
          filter: 'isFile'
        }
        {
          # Assets, except .scss files
          expand: true
          cwd: 'src/assets'
          src: ['**', '!**/*.scss', '!**/*.es6']
          dest: 'dist/public/assets'
          filter: 'isFile'
        }
        {
          # Copy favicon.ico to public root
          expand: true
          cwd: 'src/assets/images/icons'
          src: ['favicon.ico']
          dest: 'dist/public'
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
          dest: 'dist/craft/config/thearchitect'
          filter: 'isFile'
        }
        {
          # Plugins { Old Method }
          expand: true
          cwd: 'src/craft'
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
        {
          # beam.json
          expand: true
          cwd: 'src'
          src: 'beam.json'
          dest: 'dist'
        }
      ]
    craft_plugins:
      files: [
        {
          # The Architect Plugin
          expand: true
          cwd: 'craft/plugins/craftcms-thearchitect'
          src: 'thearchitect/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Cookies Plugin
          expand: true
          cwd: 'vendor/nystudio107/cookies'
          src: '**'
          dest: 'dist/craft/plugins/cookies'
          filter: 'isFile'
        }
        {
          # InstantAnalytics Plugin
          expand: true
          cwd: 'craft/plugins'
          src: 'instantanalytics/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Minify Plugin
          expand: true
          cwd: 'craft/plugins'
          src: 'minify/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Rich Variables Plugin
          expand: true
          cwd: 'craft/plugins'
          src: 'richvaraibles/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # SEOmatic Plugin
          expand: true
          cwd: 'craft/plugins'
          src: 'seomatic/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Transcoder Plugin
          expand: true
          cwd: 'craft/plugins'
          src: 'transcoder/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Contact Form Plugin
          expand: true
          cwd: 'vendor/craftcms/contact-form'
          src: 'contactform/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # CPFieldLinks Plugin
          expand: true
          cwd: 'vendor/mmikkel/CpFieldLinks-Craft'
          src: 'cpfieldlinks/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Reasons Plugin
          expand: true
          cwd: 'vendor/mmikkel/Reasons-Craft'
          src: 'reasons/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # FocusPoint Plugin
          expand: true
          cwd: 'vendor/smcyr/Craft-FocusPoint'
          src: 'focuspoint/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Neo Plugin
          expand: true
          cwd: 'vendor/benjamminf/craft-neo'
          src: 'neo/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Quick Field Plugin
          expand: true
          cwd: 'vendor/benjamminf/craft-quick-field'
          src: 'quickfield/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Relabel Plugin
          expand: true
          cwd: 'vendor/benjamminf/craft-relabel'
          src: 'relabel/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # No-Cache Plugin
          expand: true
          cwd: 'vendor/benjamminf/craft-nocache'
          src: 'nocache/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Safe Delete Plugin
          expand: true
          cwd: 'vendor/christianruhstaller/craft-safedelete'
          src: 'safedelete/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Typogrify Plugin
          expand: true
          cwd: 'vendor/jamiepittock/craft-typogrify'
          src: 'typogrify/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Field Notes Plugin
          expand: true
          cwd: 'vendor/michaelrog/craftfieldnotes'
          src: 'fieldnotes/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Expanded Singles Plugin
          expand: true
          cwd: 'vendor/engram-design/ExpandedSingles'
          src: 'expandedsingles/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Super Table Plugin
          expand: true
          cwd: 'vendor/engram-design/SuperTable'
          src: 'supertable/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Super Table Plugin
          expand: true
          cwd: 'vendor/engram-design/ImageResizer'
          src: 'imageresizer/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Imager Plugin
          expand: true
          cwd: 'vendor/aelvan/Imager-Craft'
          src: 'imager/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Fruit LinkIt
          expand: true
          cwd: 'vendor/fruitstudios/LinkIt'
          src: 'fruitlinkit/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Navee Plugin
          expand: true
          cwd: 'vendor/fromtheoutfit'
          src: 'navee/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
        {
          # Redactor Extras Plugin
          expand: true
          cwd: 'vendor/elliotlewis/Redactor-Extras'
          src: 'redactorextras/**'
          dest: 'dist/craft/plugins'
          filter: 'isFile'
        }
      ]
  return
