module.exports = (grunt) ->
  grunt.config 'bower_concat',
    all:
      dest: 'dist/public/assets/scripts/vendor.js'
      cssDest: 'dist/public/assets/styles/vendor.css'
      exclude: [
        'bourbon'
        'bitters'
        'neat'
        'normalize-scss'
        'omega-reset-for-bourbon-neat'
        'animate-sass'
        'Ionicons'
        'font-awesome'
      ]
      mainFiles:
        'dropkick': 'build/js/dropkick.min.js'
        'fancybox': 'source/jquery.fancybox.js'
        'slick-carousel': ['slick/slick.js', 'slick/slick.css', 'slick/slick-theme.css']
        'select2': ['dist/js/select2.min.js', 'dist/css/select2.min.css']
      dependencies:
        'dropkick': 'jquery'
  return
